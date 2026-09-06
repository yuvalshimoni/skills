#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

name_ok() {
  local n="$1"
  [[ "$n" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] && ((${#n} <= 64))
}

while IFS= read -r -d '' skill_md; do
  dir="$(dirname "$skill_md")"
  folder="$(basename "$dir")"
  frontmatter="$(awk 'BEGIN{p=0} /^---$/{p++; next} p==1{print}' "$skill_md")"
  name="$(printf '%s\n' "$frontmatter" | awk -F': *' '/^name:/{print $2; exit}')"
  desc="$(printf '%s\n' "$frontmatter" | awk -F': *' '/^description:/{sub(/^description:[[:space:]]*/,""); print; exit}')"

  if [[ -z "$name" || -z "$desc" ]]; then
    echo "error: $skill_md needs YAML frontmatter with name and description"
    fail=1
    continue
  fi
  if [[ "$name" != "$folder" ]]; then
    echo "error: $skill_md name '$name' does not match folder '$folder'"
    fail=1
  fi
  if ! name_ok "$name"; then
    echo "error: $skill_md name '$name' must be lowercase kebab-case, 1-64 chars"
    fail=1
  fi
  if ((${#desc} > 1024)); then
    echo "error: $skill_md description is longer than 1024 characters"
    fail=1
  fi
done < <(find "$root/skills" -name SKILL.md -print0)

if [[ -f "$root/.claude-plugin/plugin.json" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 - <<PY
import json, os, sys
root = "$root"
plugin = json.load(open(os.path.join(root, ".claude-plugin/plugin.json")))
missing = []
for rel in plugin.get("skills", []):
    path = os.path.join(root, rel.lstrip("./"), "SKILL.md")
    if not os.path.isfile(path):
        missing.append(rel)
if missing:
    print("error: plugin.json lists skills with no SKILL.md: " + ", ".join(missing))
    sys.exit(1)
PY
    if [[ $? -ne 0 ]]; then
      fail=1
    fi
  fi
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
echo "ok: skills are valid"

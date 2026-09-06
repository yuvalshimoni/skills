# At a Glance examples

Example of a prop rename:

````markdown
## At a Glance

**`LabelValue` — prop rename**

```diff
- <LabelValue overline="Status" value="Active" />
+ <LabelValue label="Status" value="Active" />
```
````

Example of a new component:

````markdown
## At a Glance

**New `AssetDescriptor` component**

```tsx
<AssetDescriptor icon={<ServerIcon />} name="prod-db-01" type="Database Instance" />
```
````

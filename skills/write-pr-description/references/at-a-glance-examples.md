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

Example of an API contract change:

````markdown
## At a Glance

**`POST /api/users` — accept a role**

```diff
- POST /api/users { "name": "Ada" }
+ POST /api/users { "name": "Ada", "role": "admin" }
```
````

Example of a database schema change:

````markdown
## At a Glance

**Add `users.role`**

```sql
ALTER TABLE users
ADD COLUMN role text NOT NULL DEFAULT 'member';
```
````

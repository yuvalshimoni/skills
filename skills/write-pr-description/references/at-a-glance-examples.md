# At a Glance examples

Example of frontend behavior:

````markdown
## At a Glance

**Show progress while checkout is submitted**

```diff
- <Button type="submit">Pay now</Button>
+ <Button type="submit" disabled={isPending}>
+   {isPending ? "Processing…" : "Pay now"}
+ </Button>
```
````

Example of backend authorization behavior:

````markdown
## At a Glance

**Scope session revocation to the signed-in user**

```diff
- await db.session.delete({ where: { id: sessionId } });
+ await db.session.delete({
+   where: { id: sessionId, userId: user.id },
+ });
```
````

Example of a shared API contract change:

````markdown
## At a Glance

**Allow project visibility to be configured**

```diff
 export const createProjectInput = z.object({
   name: z.string().min(1),
+  visibility: z.enum(["private", "public"]).default("private"),
 });
```
````

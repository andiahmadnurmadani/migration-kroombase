# migration-kroombase

Migration files for a KroomBase project.

Every `.sql` file in `migrations/` is applied to this project's schema, in name order,
once each, when it is pushed to `main`. The push is delivered to the project's
webhook, which fetches the new files and runs them.

| File | Creates |
|---|---|
| `001_create_customers.sql` | `customers` |
| `002_create_orders.sql` | `orders` (FK to `customers`) |

-- 002_create_orders
-- One row per order; a customer may have many.
--
-- Deliberately depends on 001: if the runner ever applies files out of order, or skips the
-- first one, this fails loudly with "relation customers does not exist" instead of quietly
-- producing a half-built schema.

CREATE TABLE orders (
  id           BIGSERIAL PRIMARY KEY,
  customer_id  BIGINT NOT NULL REFERENCES customers (id) ON DELETE CASCADE,
  reference    TEXT NOT NULL UNIQUE,
  status       TEXT NOT NULL DEFAULT 'pending',
  total_cents  INTEGER NOT NULL DEFAULT 0,
  placed_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_orders_customer ON orders (customer_id);
CREATE INDEX idx_orders_status ON orders (status);

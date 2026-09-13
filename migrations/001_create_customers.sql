-- 001_create_customers
-- Customers who can place orders.
--
-- The leading comment is deliberate: it exercises the statement filter that previously
-- dropped any statement preceded by a comment, which silently skipped CREATE TABLE while
-- still reporting success.

CREATE TABLE customers (
  id          BIGSERIAL PRIMARY KEY,
  email       TEXT NOT NULL UNIQUE,
  full_name   TEXT NOT NULL,
  is_active   BOOLEAN NOT NULL DEFAULT true,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Lookups by email happen on every sign-in.
CREATE UNIQUE INDEX idx_customers_email ON customers (email);

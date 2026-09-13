-- 003_add_order_notes
-- Adds a note column to orders, plus an index used by the order list.
--
-- This file exists to prove the incremental path: when it is pushed, the runner must apply
-- ONLY this file and report the two earlier ones as skipped, because it already recorded
-- them in the ledger.
--
-- Leading comment on purpose: the statement filter must not drop what follows it.
ALTER TABLE orders ADD COLUMN IF NOT EXISTS note text;

CREATE INDEX IF NOT EXISTS orders_customer_id_idx ON orders (customer_id);

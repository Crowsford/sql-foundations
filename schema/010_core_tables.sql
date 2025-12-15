CREATE TABLE IF NOT EXISTS core.users (
  user_id    BIGSERIAL PRIMARY KEY,
  email      TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.products (
  product_id BIGSERIAL PRIMARY KEY,
  name       TEXT NOT NULL,
  price      NUMERIC(12,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS core.orders (
  order_id BIGSERIAL PRIMARY KEY,
  user_id  BIGINT NOT NULL REFERENCES core.users(user_id),
  order_ts TIMESTAMPTZ NOT NULL DEFAULT now(),
  status   TEXT NOT NULL CHECK (status IN ('created','paid','canceled'))
);

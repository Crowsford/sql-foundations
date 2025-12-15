-- Day 1: 10 basic SQL queries (PostgreSQL)

-- #1 All users ordered by created_at desc
SELECT
  u.user_id,
  u.email,
  u.created_at
FROM core.users AS u
ORDER BY u.created_at DESC;

-- #2 Top 5 most expensive products
SELECT
  p.name,
  p.price
FROM core.products AS p
ORDER BY p.price DESC, p.name
LIMIT 5;

-- #3 Users with 'gmail' in email
SELECT
  u.user_id,
  u.email
FROM core.users AS u
WHERE u.email ILIKE '%gmail%'
ORDER BY u.user_id;

-- #4 Last 20 orders with status 'created'
SELECT
  o.order_id,
  o.user_id,
  o.order_ts,
  o.status
FROM core.orders AS o
WHERE o.status = 'created'
ORDER BY o.order_ts DESC
LIMIT 20;

-- #5 Orders for the last 7 days
SELECT
  o.order_id,
  o.user_id,
  o.order_ts,
  o.status
FROM core.orders AS o
WHERE o.order_ts >= now() - interval '7 days'
ORDER BY o.order_ts DESC;

-- #6 Orders count by status
SELECT
  o.status,
  COUNT(*) AS orders_cnt
FROM core.orders AS o
GROUP BY o.status
ORDER BY orders_cnt DESC, o.status;

-- #7 Oldest and newest user created_at
SELECT
  MIN(u.created_at) AS oldest_user_created_at,
  MAX(u.created_at) AS newest_user_created_at
FROM core.users AS u;

-- #8 Orders count per user
SELECT
  o.user_id,
  COUNT(*) AS orders_cnt
FROM core.orders AS o
GROUP BY o.user_id
ORDER BY orders_cnt DESC, o.user_id;

-- #9 Unique users who made orders
SELECT
  COUNT(DISTINCT o.user_id) AS unique_users_with_orders
FROM core.orders AS o;

-- #10 Users with >= 2 orders
SELECT
  o.user_id,
  COUNT(*) AS orders_cnt
FROM core.orders AS o
GROUP BY o.user_id
HAVING COUNT(*) >= 2
ORDER BY orders_cnt DESC, o.user_id;
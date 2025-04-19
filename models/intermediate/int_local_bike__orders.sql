WITH order_items_agg AS (
  SELECT
    order_id,
    SUM(total_order_item_amount) AS total_order_amount,
    SUM(product_quantity) AS total_items_by_order
  FROM {{ ref('stg_local_bike__order_items') }}
  GROUP BY order_id
)
SELECT
  o.order_id,
  o.order_date,
  s.store_name,
  COALESCE(oi.total_order_amount, 0) AS total_order_amount,
  COALESCE(oi.total_items_by_order, 0) AS total_items_by_order
FROM {{ ref('stg_local_bike__orders') }} o
LEFT JOIN {{ ref('stg_local_bike__stores') }} s ON s.store_id = o.store_id
LEFT JOIN order_items_agg oi ON oi.order_id = o.order_id
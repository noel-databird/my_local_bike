{{ config(materialized='table') }}

SELECT 
    order_date,
    EXTRACT(MONTH FROM order_date) as order_month,
    EXTRACT(YEAR FROM order_date) as order_year,
    store_name,
    COUNT(*) AS count_orders,
    ROUND(SUM(total_order_amount),2) AS sum_total_amount,
    SUM(total_items_by_order) AS sum_total_items_by_orders
FROM {{ ref('int_local_bike__orders') }}
GROUP BY 
    order_date,
    EXTRACT(MONTH FROM order_date),
    EXTRACT(YEAR FROM order_date),
    store_name
    
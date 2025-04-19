SELECT 
    CONCAT(order_id, '_' , item_id) AS order_item_id, -- primary_key
    order_id,
    item_id,
    product_id,
    quantity AS product_quantity,
    list_price AS product_price,
    discount AS product_discount,
    ((quantity * list_price) * (1 - discount)) AS total_order_item_amount
FROM {{ source('local_bike', 'order_items') }}
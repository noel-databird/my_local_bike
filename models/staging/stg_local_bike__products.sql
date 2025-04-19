SELECT 
    product_id,
    product_name, 
    brand_id AS product_brand_id, 
    category_id AS product_category_id, 
    model_year AS product_model_year,
    list_price AS product_price
FROM {{ source('local_bike', 'products') }}
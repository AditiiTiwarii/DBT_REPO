{{ config(materialized='view') }}

SELECT 
    product_id, 
    LOWER(product_name) AS product_name, 
    LOWER(category) AS category, 
    price
FROM {{ source('raw', 'products') }}
WHERE product_id IS NOT NULL

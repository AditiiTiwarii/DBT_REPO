{{ config(materialized='view') }}

SELECT 
    order_id, 
    customer_id AS cust_id, 
    order_date, 
    LOWER(order_status) AS order_status, 
    total_amount
FROM {{ source('raw', 'orders') }}
WHERE order_id IS NOT NULL

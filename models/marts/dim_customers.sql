{{ config(materialized='table') }}

SELECT 
    cust_id ,
    customer_full_name,
    email,
    created_at
FROM {{ ref('int_orders') }}

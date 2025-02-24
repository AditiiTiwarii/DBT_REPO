{{ config(materialized='view') }}

SELECT 
    customer_id AS cust_id, 
    LOWER(first_name) AS first_name, 
    LOWER(last_name) AS last_name, 
    LOWER(email) AS email, 
    created_at
FROM {{ source('raw', 'customers') }}
WHERE customer_id IS NOT NULL

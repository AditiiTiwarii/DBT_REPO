{{ config(materialized='table') }}

SELECT 
    o.order_id,
    o.cust_id,
    o.order_date,
    o.order_status,
    o.total_amount,
    c.first_name || ' ' || c.last_name AS customer_full_name,
    c.email,
    c.created_at
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_customers') }} c 
    ON o.cust_id = c.cust_id
WHERE o.order_status != 'canceled'

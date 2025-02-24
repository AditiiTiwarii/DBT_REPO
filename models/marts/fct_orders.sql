{{ config(materialized='table') }}

SELECT 
    o.order_id,
    o.cust_id,
    o.order_date,
    o.total_amount,
    o.customer_full_name,
    EXTRACT(YEAR FROM o.order_date) AS order_year
FROM {{ ref('int_orders') }} o

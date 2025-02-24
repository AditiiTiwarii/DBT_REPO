{{ config(materialized='table') }}

SELECT 
    oi.order_id,
    sum(oi.quantity * oi.unit_price) AS total_revenue
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_products') }} p 
    ON oi.product_id = p.product_id
    group by oi.order_id

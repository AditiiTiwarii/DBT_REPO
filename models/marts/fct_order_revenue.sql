{{ config(materialized='table') }}

SELECT 
    o.order_id,
    ir.total_revenue,
    o.order_status
FROM {{ ref('int_order_revenue') }} ir
JOIN {{ ref('int_orders') }} o 
    ON ir.order_id = o.order_id

SELECT
    ol.order_line_id,
    o.order_id,
    o.customer_id,
    o.shipping_address_id AS address_id,
    ol.product_id,
    ol.seller_id,
    o.order_date,
    ol.quantity,
    ol.unit_price_at_sale,
    ol.line_total
FROM {{ ref('stg_order_line') }} ol
JOIN {{ ref('stg_orders') }} o 
    ON ol.order_id = o.order_id

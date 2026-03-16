SELECT
    order_line_id,
    order_id,
    product_id,
    seller_id,
    quantity,
    unit_price_at_sale,
    quantity * unit_price_at_sale AS line_total
FROM order_line

SELECT
    product_id,
    SUM(quantity) AS total_quantity_sold,
    SUM(line_total) AS total_sales
FROM {{ ref('fact_orders') }}
GROUP BY product_id
ORDER BY total_sales DESC

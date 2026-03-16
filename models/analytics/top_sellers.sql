SELECT
    seller_id,
    SUM(line_total) AS total_sales
FROM {{ ref('fact_orders') }}
GROUP BY seller_id
ORDER BY total_sales DESC

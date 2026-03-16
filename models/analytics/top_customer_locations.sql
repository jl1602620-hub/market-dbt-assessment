SELECT
    a.city,
    a.state,
    SUM(f.line_total) AS total_sales
FROM {{ ref('fact_orders') }} f 
JOIN {{ ref('dim_address') }} a 
    ON f.address_id = a.address_id
GROUP BY a.city, a.state
ORDER BY total_sales DESC

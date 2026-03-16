SELECT DISTINCT
    order_date AS date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
    EXTRACT(QUARTER FROM order_date) AS quarter 
FROM {{ ref('stg_orders') }}

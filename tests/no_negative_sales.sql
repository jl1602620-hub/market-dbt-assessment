SELECT *
FROM {{ ref('fact_orders') }}
WhERE line_total <= 0

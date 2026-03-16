SELECT
    product_id,
    product_name,
    category,
    brand
FROM {{ ref('stg_product') }}

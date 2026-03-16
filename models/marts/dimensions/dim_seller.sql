SELECT
    seller_id,
    store_name,
    rating,
    joined_date
FROM {{ ref('stg_seller') }}

SELECT
    address_id,
    address_line_1,
    city,
    state,
    zip_code,
    is_default_shipping
FROM {{ ref('stg_customer_address') }}

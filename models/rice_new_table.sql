{{ config(
    materialized='table'
    alias='only_four_elements'
) }}

SELECT 
    YEAR,
    MONTH,
    PRICE_WHEAT_TON,
    PRICE_RICE_TON
FROM 
    DBT_DATABASE.DBT_SCHEMA.NEW_RICE
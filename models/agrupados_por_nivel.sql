{{ config(
    materialized='table',
    alias='por_profesion'
) }}

SELECT COUNT(*) CANTIDAD , NIVEL FROM(
SELECT 
    CONCAT(NOMBRE, ' ',APELLIDO_PATERNO, ' ',APELLIDO_MATERNO) AS CANTIDAD,
    NIVEL,

FROM 
     {{ source('DBT_SCHEMA', 'BECAS') }}
) AS NOMBRE_CONCATENADO
GROUP BY NOMBRE_CONCATENADO.NIVEL
LIMIT 3

{{ config(
    materialized='table',
    alias='Porcentaje_de_estudiantes'
) }}

SELECT 
    NIVEL,
    COUNT(*) AS CANTIDAD_ESTUDIANTES,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS PORCENTAJE_ESTUDIANTES
FROM 
    {{ source('DBT_SCHEMA', 'BECAS') }}
WHERE NIVEL IS NOT NULL
GROUP BY 
    NIVEL
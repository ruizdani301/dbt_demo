{{ config(materialized="table", alias="Porcentaje_de_estudiantess") }}

select
    nivel,
    count(*) as cantidad_estudiantes,
    round(100.0 * count(*) / sum(count(*)) over (), 2) as porcentaje_estudiantes
from {{ source("DBT_SCHEMA", "BECAS") }}
where nivel is not null
group by nivel
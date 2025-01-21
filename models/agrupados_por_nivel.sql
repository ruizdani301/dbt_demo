{{ config(materialized="table", alias="por_profesion") }}

select count(*) cantidad, nivel
from
    (
        select
            concat(nombre, ' ', apellido_paterno, ' ', apellido_materno) as cantidad,
            nivel,

        from {{ source("DBT_SCHEMA", "BECAS") }}
    ) as nombre_concatenado
group by nombre_concatenado.nivel
limit 3

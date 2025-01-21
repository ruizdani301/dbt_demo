-- {{ config(materialized="table", alias="por_profesion") }}

-- select count(*) cantidad, nivel
-- from
--     (
--         select
--             concat(nombre, ' ', apellido_paterno, ' ', apellido_materno) as cantidad,
--             nivel,

--         from {{ source("DBT_SCHEMA", "BECAS") }}
--     ) as nombre_concatenado
-- group by nombre_concatenado.nivel
-- limit 3

{{ config(materialized="table", alias="Porcentaje_de_estudiantes") }}

select
    nivel,
    count(*) as cantidad_estudiantes,
    round(100.0 * count(*) / sum(count(*)) over (), 2) as porcentaje_estudiantes
from {{ source("DBT_SCHEMA", "BECAS") }}
where nivel is not null
group by nivel
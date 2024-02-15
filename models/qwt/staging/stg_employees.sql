{{config (materialized = 'table',alias = 'stg_empoyees')}}

select * from  qwt_project.raw.employee
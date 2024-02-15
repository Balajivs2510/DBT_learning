{{config (materialized = 'table',alias = 'stg_products')}}

select * from  qwt_project.raw.Products
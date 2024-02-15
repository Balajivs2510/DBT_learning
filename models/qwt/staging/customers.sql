
{{config (materialized = 'table',alias = 'stg_customers')}}

select * from  qwt_project.raw.Customer
{{config (materialized = 'table',alias = 'stg_offices')}}

select * from  qwt_project.raw.offices
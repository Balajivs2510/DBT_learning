{{config (materialized = 'table',alias = 'dummy_Orders')}}

select * from qwt_project.raw.Orders
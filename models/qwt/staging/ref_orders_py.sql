{{config (materialized = 'table',alias = 'dummy_Orders')}}

select * from {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.Orders
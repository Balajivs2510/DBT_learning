{{config (materialized = 'table',alias = 'stg_products')}}

select * from   {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.Products
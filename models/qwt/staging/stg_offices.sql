{{config (materialized = 'table',alias = 'stg_offices')}}

select * from  {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.offices
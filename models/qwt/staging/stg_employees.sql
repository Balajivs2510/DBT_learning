{{config (materialized = 'table',alias = 'stg_empoyees')}}

select * from  {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.employee
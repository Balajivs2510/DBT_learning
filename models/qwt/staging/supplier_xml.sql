

{{config (materialized = 'table',alias = 'SUPPLIERS_XML')}}

select * from  {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.SUPPLIERS_XML
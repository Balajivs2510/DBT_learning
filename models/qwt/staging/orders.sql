{{ config(materialized="incremental", alias="stg_orders", unique_key="OrderID") }}

select *
from {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.orders

{% if is_incremental() %}

    where orderdate > (select max(orderdate) from {{ this }})

{% endif %}

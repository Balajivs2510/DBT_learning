{{ config(materialized="incremental", alias="stg_orders", unique_key="OrderID") }}

select *
from qwt_project.raw.orders

{% if is_incremental() %}

    where orderdate > (select max(orderdate) from {{ this }})

{% endif %}

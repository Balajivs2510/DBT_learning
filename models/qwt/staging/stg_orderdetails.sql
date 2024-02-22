{{config(materialized='incremental',unique_key = ['OrderID','lineno'])}}
select od.*
from {{env_var('dbt_sourcedb','qwt_project')}}.{{env_var('dbt_sourceschema','raw')}}.ORDERDEATILS od
inner join {{ ref('orders') }} o on od.OrderID = o.OrderID
{% if is_incremental() %}
 where o.OrderDate >= (select MAX(OrderDate) from {{ref('orders')}}) 
{% endif %}
{{config (materialized = 'view',schema ='reporting',alias = 'order_by_product_sales')}}
 
 
--{% set linenos =[1,2,3,4,5] %}  
 
{% set linenos = get_order_linenos() %}
 
select orderid,
{% for lineno in linenos %}
nvl(sum(case when LINENO = {{lineno}} then (QUANTITY*UNITPRICE) end),0)  as lineno_{{lineno}}_amount,
{% endfor %}
sum(QUANTITY*UNITPRICE) as total_order_amount
from
{{ ref('stg_orderdetails') }}  
group by 1
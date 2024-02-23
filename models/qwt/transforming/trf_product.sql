{{config (materialized = 'table',schema = env_var('dbt_trfschema','TRANSFORMING'))}}

select 

ProductID ,
ProductName ,
SupplierID ,
CategoryID ,
QuantityPerUnit ,
UnitCost ,
UnitPrice ,
UnitsInStock ,
UnitsOnOrder ,
case when UnitsInStock >0 then  'yes'
    else    'NO' end as product_availabilty,
(UnitPrice - UnitCost) as profit

from 
{{ref('Products')}}
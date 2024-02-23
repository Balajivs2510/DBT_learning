{{ config(materialized="table", schema=env_var('dbt_trfschema','TRANSFORMING')) }}


select
    od.*,
    (od.unitprice * od.quantity) * (1 - od.discount) as linesalesamount,
    (p.unitcost * od.quantity) as costofgoodssold,
    (
        ((od.unitprice * od.quantity) * (1 - od.discount)) - (p.unitcost * od.quantity)
    ) as margin
from {{ ref("stg_orderdetails") }} as od
inner join {{ ref("Products") }} as p on od.productid = p.productid

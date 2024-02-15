{{config (materialized = 'view',schema ='reporting',alias = 'employee_by_aggregate')}}


select
e.EMPID,
e.FIRST_NAME,
date_part('month', f.orderdate) as order_month,
year(f.orderdate) as order_year,
f.LINESALESAMOUNT,
f.margin
from
{{ ref('stg_employees') }} e
inner join {{ ref('stg_offices') }}  o on e.OFFICE = o.OFFICE
inner join {{ ref('fct_orders') }} f on f.employeeid = e.EMPID
--where o.OFFICECITY= '{{var('city')}}'
where o.OFFICECITY = '{{var('city','Nice')}}'
group by e.EmpID,e.FIRST_NAME ,f.margin,f.LINESALESAMOUNT,order_month,order_year
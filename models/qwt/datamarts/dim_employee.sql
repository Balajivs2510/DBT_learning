{{config(materialized='view', schema = 'sales_mart')}}
select * from
{{ ref('trf_employee') }}
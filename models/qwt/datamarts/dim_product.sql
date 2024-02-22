{{config (materialized = 'view',schema ='sales_mart',alias = 'dim_product')}}


select 


p.*,
s.companyname,
s.contactname,
s.country,
s.city,
c.categoryname
from 
{{ref("trf_product")}} as p
inner join
{{ref("trf_supplier")}} as s
on p.SUPPLIERID =s.SUPPLIERID
inner join
{{ ref('categories') }} c
on c.categoryId = p.categoryId
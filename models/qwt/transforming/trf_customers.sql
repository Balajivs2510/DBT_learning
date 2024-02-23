{{config (materialized = 'table',schema = env_var('dbt_trfschema','TRANSFORMING')
)}}


select 
CustomerID ,
CompanyName ,
ContactName ,
City ,
Country ,
DivisionID ,
Address ,
Fax ,
Phone number ,
substr(PostalCode, 1, 5) as zip_code,
CASE WHEN COALESCE(StateProvince,'')='' THEN 'NA' ELSE StateProvince END AS STATE 

from
{{ref('customers')}}
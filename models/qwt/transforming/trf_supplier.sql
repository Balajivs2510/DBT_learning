{{config (materialized = 'table',schema = 'TRANSFORMING')}}


select 
get(xmlget(Suppliers_data,'SupplierID'),'$') as SupplierID
,get(xmlget(Suppliers_data,'CompanyName'),'$')::varchar as CompanyName
,get(xmlget(Suppliers_data,'ContactName'),'$')::varchar as ContactName
,get(xmlget(Suppliers_data,'Address'),'$')::varchar as Address
,get(xmlget(Suppliers_data,'City'),'$')::varchar as  City
,get(xmlget(Suppliers_data,'PostalCode'),'$')::varchar as PostalCode
,get(xmlget(Suppliers_data,'Country'),'$')::varchar as Country
,get(xmlget(Suppliers_data,'Phone'),'$')::varchar as Phone
,get(xmlget(Suppliers_data,'Fax'),'$')::varchar as Fax
from 
{{ref('supplier_xml')}}

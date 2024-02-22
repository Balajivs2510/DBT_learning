{{config (materialized = 'view',schema ='sales_mart',alias = 'fact_orders')}}


select
o.orderid,
o.customerid,
o.employeeid,
od.lineno,
od.QUANTITY,
od.UNITPRICE,
od.discount,
od.linesalesamount,
od.costofgoodssold,
od.margin,
o.FREIGHT,
o.orderdate

 from 
 {{ref('orders')}} o

 inner join 
  {{ref('trf_orderdetails')}} od
  on od.ORDERID= o.ORDERID
  inner join
  {{ref('shippers')}} s
  on o.SHIPPERID = S.SHIPPERID
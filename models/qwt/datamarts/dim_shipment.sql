{{config(materialized = 'view',schema ='sales_mart',alias = 'dim_shipments')}}

select 
 ss.OrderID
 ,ss.LineNo
 ,ss.ShipperID
 ,s.CompanyName as shipmentcompany
 ,ss.ShipmentDate
 ,ss.Status
 ,ss.valid_from
 ,ss.valid_to

 from {{ref('shipments_snapshot')}} as ss
 inner join
  {{ref('shippers')}} as s
 on ss.SHIPPERID =s.ShipperID
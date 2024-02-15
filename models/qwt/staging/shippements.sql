{{config (materialized = 'table',alias = 'stg_shippments')}}

select OrderID	, LineNo ,	ShipperID ,	
CustomerID ,	ProductID ,	EmployeeID ,	to_date(SUBSTR(ShipmentDate,1,regexp_instr(ShipmentDate,' ',1,1)-1))  as ShipmentDate ,	Status 

 from  qwt_project.raw.shippments
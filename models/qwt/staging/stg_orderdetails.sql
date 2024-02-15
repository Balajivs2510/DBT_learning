{{
    config(
        materialized='incremental',alias = 'stg_orderdetails', unique_key='OrderID'

    )
}}

select OD.* from qwt_project.raw.ORDERDEATILS OD
Join {{ref('orders')}} os
on OD.OrderID = os.OrderID

{% if is_incremental() %}

 where os.OrderDate > (select max(os.OrderDate) from  {{ref('orders')}})

{% endif %}  

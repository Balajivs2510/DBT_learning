{% snapshot shipments_snapshot %}

{{
    config
    (
        target_database ='QWT_PROJECT',
        target_schema ='snapshots',
        unique_key ="OrderID|| '-'||LineNo",
        strategy ='timestamp',
        updated_at ='ShipmentDate'
    )
}}

select * from {{ref('shippements')}}


{% endsnapshot %}
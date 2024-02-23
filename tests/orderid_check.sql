select orderid from {{ ref('orders') }}
where orderid < 10000 or orderid>16935
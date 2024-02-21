select PRODUCTID,
sum(PROFIT) as productprofit
from {{ ref('trf_product') }}
group by 1
having  productprofit <= 0
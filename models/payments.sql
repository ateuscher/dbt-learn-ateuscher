{% set payment_methods = ['bank_transfer','coupon','credit_card','gift_card'] %}



with payments as (
  select *
  from {{ source('stripe','payment') }}
  where status = 'success'
  )
  
select orderid, 
  {%- for method in payment_methods %}
    sum(case when paymentmethod = '{{ method }}' then {{ to_dollars('amount') }} else 0 end) as {{ method }}_amount {%- if not loop.last -%}, {%- endif %} 
  {%- endfor %}
from payments
group by 1
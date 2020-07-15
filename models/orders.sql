 with summed_payments as (
     select order_id, sum(amount) as amount
     from {{ ref('stg_payments') }}
     group by 1
 ),

 orders as (
     select * from {{ ref('stg_orders') }}
 )
 
 
 select orders.*,
    summed_payments.amount
 from summed_payments 
 join orders on summed_payments.order_id = orders.order_id
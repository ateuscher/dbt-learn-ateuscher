 with payments as (
     select * from {{ ref('stg_payments') }}
 ),

 orders as (
     select * from {{ ref('stg_orders') }}
 )
 
 
 select orders.order_id, 
    orders.user_id,
    orders.order_date,
    orders.status,
    payments.amount
 from payments 
 join orders on payments.order_id = orders.order_id
{{config(materialized='table')}}
select c.customerid ,count(o.orderid) 
as no_of_orders,
count(o.orderid) 
as no_of_orders2,
concat(c.firstname,c.lastname) as customer_name from 
 sleekmart_oms.l1_landing.customers c join 
sleekmart_oms.l1_landing.orders o on c.customerid=o.customerid
group by c.customerid ,customer_name
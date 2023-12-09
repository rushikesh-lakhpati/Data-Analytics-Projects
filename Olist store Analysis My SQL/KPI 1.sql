create database olist_projects;
use olist_projects;

create table kpi1;

select orders.order_id, orders.order_purchase_timestamp, payment.payment_value, payment.payment_type
from olist_projects.olist_orders_dataset as orders left join olist_projects.olist_order_payments_dataset as payment
on orders.order_id= payment.order_id;


select * from kpi1;

select dayname(order_Purchase_timestamp) 
from kpi1;

select 
if(dayname(Order_purchase_timestamp) in ("Sunday","Saturday") , "Weekend","Weekday") as Day_Type
,round(sum(payment_value) ,2) as Total_Payment 
from kpi1
group by Day_type;
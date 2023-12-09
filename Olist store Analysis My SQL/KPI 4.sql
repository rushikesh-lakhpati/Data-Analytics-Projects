Create table KPI_4;

Select o.order_id , c.customer_id ,c.customer_city , i.price, p.payment_value
from olist_projects.olist_orders_dataset o 
left join olist_projects.olist_customers_dataset c on 
o.customer_id = c.customer_id 
left join olist_projects.olist_order_items_dataset i on
o.order_id = i.order_id 
left join olist_projects.olist_order_payments_dataset p on
o.order_id = p.order_id;

select * from kpi_4;

select 
round(Avg(price),2) as Average_Price 
,Round(Avg(Payment_value),2) as Average_Payment 
from kpi_4 
where customer_city = "Sao paulo";
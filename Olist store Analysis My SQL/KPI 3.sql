create table kpi3;

select  o.order_delivered_customer_date, o.order_purchase_timestamp , 
i.product_id,p.product_category_name 
from olist_projects.olist_orders_dataset o
left join olist_projects.olist_order_items_dataset i on
o.order_id = i.order_id
left join olist_projects.olist_products_dataset p on
i.product_id = p.product_id;
 
 
select * from kpi3;
 
 
select round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp)),0) as Average_number_of_days 
from kpi3
where product_category_name = "Pet_shop";
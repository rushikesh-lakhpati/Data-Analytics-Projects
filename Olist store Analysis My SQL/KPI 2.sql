Create table kpi2;

Select  o.order_id , p.payment_type,r.review_score 
from olist_projects.olist_orders_dataset o 
left join olist_projects.olist_order_payments_dataset p on 
o.order_id = p.Order_id 
left join olist_projects.olist_order_reviews_dataset r on 
o.order_id = r.order_id;


select * from kpi2;


select count(order_id) as Total_orders
from kpi2
where payment_type = "credit_card" and review_score = 5; 
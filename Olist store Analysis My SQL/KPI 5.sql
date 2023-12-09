create table KPI_5;

Select O.Order_purchase_timestamp , o.order_delivered_customer_date , r.review_score
from olist_projects.olist_orders_dataset o
left join olist_projects.olist_order_reviews_dataset r on 
o.order_id = r.order_id ;


Select 
Review_Score
,round(Avg(datediff(order_delivered_customer_date , order_purchase_timestamp)),0) as Shipping_Days 
from Kpi_5 
where Review_score is not null
group by Review_Score
order by Review_Score;
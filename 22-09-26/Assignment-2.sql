/*
1. Product Sales
You need to create a report on whether customers who 
purchased the product named '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' 
buy the product below or not.

1. 'Polk Audio - 50 W Woofer - Black' -- (other_product)

To generate this report, you are required to use the 
appropriate SQL Server Built-in functions or 
expressions as well as basic SQL knowledge.
*/

-------------------------
select a.customer_id, a.first_name, a.last_name, isnull(b.other, 'No') as other_product
from sale.customer a left join
				(select c.customer_id, d.first_name, d.last_name,a.product_name, 'Yes' as Other
				from product.product a, sale.order_item b,
				sale.orders c, sale.customer d
				where a.product_id = b.product_id and
				b.order_id = c.order_id and 
				c.customer_id = d.customer_id
				and a.product_name = 'Polk Audio - 50 W Woofer - Black'
				and d.customer_id in
									(select distinct  c.customer_id
									from product.product a, sale.order_item b,
									sale.orders c, sale.customer d
									where a.product_id = b.product_id and
									b.order_id = c.order_id and 
									c.customer_id = d.customer_id and
									a.product_name =  '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')
				) as b
on a.customer_id = b.customer_id
where a.customer_id in (select distinct  c.customer_id
									from product.product a, sale.order_item b,
									sale.orders c, sale.customer d
									where a.product_id = b.product_id and
									b.order_id = c.order_id and 
									c.customer_id = d.customer_id and
									a.product_name =  '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')



-------------------------

--2. Conversion Rate
--Below you see a table of the actions of customers visiting the website by clicking on two different
--types of advertisements given by an E-Commerce company. Write a query to return the conversion rate for each Advertisement type.

--a.    Create above table (Actions) and insert values,

 

--b.    Retrieve count of total Actions and Orders for each Advertisement Type,

 

--c.    Calculate Orders (Conversion) rates for each Advertisement Type by dividing by total count of actions casting as float by multiplying by 1.0.

use Assignment

create table actions
( visitor_id tinyint not null primary key identity(1,1),
  adv_type char(1),
  action varchar(7));

insert actions (adv_type, action)
values  ( 'A', 'Left'),
		( 'A', 'Order'),
		( 'B', 'Left'),
		( 'A', 'Order'),
		( 'A', 'Review'),
		( 'A', 'Left'),
		( 'B', 'Left'),
		( 'B', 'Order'),
		( 'B', 'Review'),
		( 'A', 'Review');

select * from actions

select adv_type,left((COUNT(case when action = 'Order' then 1 end) * 1.0 / count(adv_type)),4) as conversion_rate
from actions
group by adv_type

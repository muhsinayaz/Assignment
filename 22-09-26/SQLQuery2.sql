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

select c.customer_id, d.first_name, d.last_name,a.product_name
from product.product a, sale.order_item b,
sale.orders c, sale.customer d
where a.product_id = b.product_id and
b.order_id = c.order_id and 
c.customer_id = d.customer_id
and d.customer_id in
					(select c.customer_id
					from product.product a, sale.order_item b,
					sale.orders c, sale.customer d
					where a.product_id = b.product_id and
					b.order_id = c.order_id and 
					c.customer_id = d.customer_id and
					a.product_name =  '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')
group by c.customer_id, d.first_name, d.last_name, a.product_name
having a.product_name = 'Polk Audio - 50 W Woofer - Black' or
a.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'


CREATE DATABASE manufacturer

CREATE TABLE product 
(
prod_id int primary key not null,
prod_name varchar(50) not null,
quantity int
)

CREATE TABLE supplier 
(
supp_id int primary key not null,
supp_name varchar(50) not null,
supp_location varchar(50) null,
supp_country varchar(50) null,
is_active bit not null
)

CREATE TABLE component 
(
comp_id int primary key not null,
comp_name varchar(50) not null,
description varchar(50) null,
quantity_comp int null
)

CREATE TABLE prod_comp 
(
prod_id int REFERENCES product (prod_id),
comp_id int REFERENCES component (comp_id),
quantity_comp int
primary key (prod_id, comp_id)
)

CREATE TABLE comp_supp 
(
supp_id int,
comp_id int,
quantity int not null,
order_date date null,
primary key (supp_id, comp_id)
)


ALTER TABLE comp_supp
ADD CONSTRAINT  fk_supplier
FOREIGN KEY (supp_id)
REFERENCES supplier (supp_id)

ALTER TABLE comp_supp
ADD CONSTRAINT  fk_component2
FOREIGN KEY (comp_id)
REFERENCES component (comp_id)

--CREATE DATABASE Manufacturer

CREATE SCHEMA pruduct;

CREATE TABLE pruduct.pruduct
(
pruduct_id int PRIMARY KEY NOT NULL,
pruduct_name varchar(50) NOT NULL,
available_quantity int NOT NULL
);

CREATE TABLE pruduct.supplier
(
supplier_id int PRIMARY KEY NOT NULL,
name_supplier int NOT NULL,
status tinyint NOT NULL
);


CREATE TABLE pruduct.component
(
component_id int  NOT NULL,
supplier_id int  NOT NULL,
name_component nvarchar(50) NOT NULL,
description nvarchar NOT NULL,
available_quantity int NOT NULL,
supply_date date NULL,
supply_quantity int NULL,
pruduct_id int FOREIGN KEY
REFERENCES pruduct.pruduct (pruduct_id),
PRIMARY KEY (component_id, supplier_id)
)

ALTER TABLE pruduct.component
ADD CONSTRAINT fk_supplier
FOREIGN KEY (supplier_id)
REFERENCES pruduct.supplier (supplier_id);
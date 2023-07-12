CREATE SCHEMA IF NOT EXISTS jelson_projects;

CREATE  TABLE jelson_projects.sales ( 
	sales_id             integer  NOT NULL  ,
	products             varchar  NOT NULL  ,
	quantity             integer  NOT NULL  ,
	prices               money  NOT NULL  ,
	order_status         char(1)  NOT NULL  ,
	CONSTRAINT pk_order_processing PRIMARY KEY ( sales_id )
 );

CREATE  TABLE jelson_projects.seller ( 
	seller_id            integer  NOT NULL  ,
	name                 varchar(100)    ,
	CONSTRAINT pk_seller PRIMARY KEY ( seller_id ),
	CONSTRAINT fk_seller_sales_0 FOREIGN KEY ( seller_id ) REFERENCES jelson_projects.sales( sales_id )   
 );


CREATE  TABLE jelson_projects.customer ( 
	customer_id          integer  NOT NULL  ,
	full_name            varchar(100)  NOT NULL  ,
	gender               varchar  NOT NULL  ,
	date_of_birth        date  NOT NULL  ,
	phone                varchar  NOT NULL  ,
	email                varchar(25)  NOT NULL  ,
	CONSTRAINT pk_customer PRIMARY KEY ( customer_id ),
	CONSTRAINT fk_customer_sales FOREIGN KEY ( customer_id ) REFERENCES jelson_projects.sales( sales_id )   
 );

CREATE  TABLE jelson_projects.product ( 
	product_id           integer  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	description          varchar  NOT NULL  ,
	price                money    ,
	CONSTRAINT pk_product PRIMARY KEY ( product_id ),
	CONSTRAINT fk_product_sales FOREIGN KEY ( product_id ) REFERENCES jelson_projects.sales( sales_id )   
 );

CREATE  TABLE jelson_projects.inventory ( 
	inventory_id         integer  NOT NULL  ,
	stock_level          integer  NOT NULL  ,
	product_availability varchar  NOT NULL  ,
	CONSTRAINT unq_inventory_inventory_id UNIQUE ( inventory_id ) ,
	CONSTRAINT fk_inventory_product FOREIGN KEY ( inventory_id ) REFERENCES jelson_projects.product( product_id )   
 );

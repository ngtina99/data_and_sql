create database customers;

-- *create table customers.customer is an option too

use customers;

create table customer(
	customer_id INT primary key,
-- it has to be unique
	first_name varchar(55) not null,
	last_name varchar(55) null
-- it can be empty, if I wouldn't put it can be empty too
);

create table address(
	address_id integer not null,
    building_number varchar(55) not null,
    street varchar(55) not null,
    city varchar(55),
    post_code varchar (55) not null,
    country varchar(55),
    CONSTRAINT
    Pk_address
-- name of the contraint
	primary key (address_id));
-- I am telling the column

CREATE TABLE email_address (
email_address_id INTEGER NOT NULL,
email_address_customer_id INTEGER,
email_address VARCHAR(55) NOT NULL,
CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);

CREATE TABLE phone_number (
phone_number_id INTEGER NOT NULL,
phone_number_customer_id INTEGER NOT NULL,
phone_number VARCHAR(55) NOT NULL,
CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id)
);

CREATE TABLE orders (
order_id INTEGER NOT NULL,
orders_customer_id INTEGER NOT NULL,
order_date DATE NOT NULL,
CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);

drop table orders;

alter table customer;
rename table customer to all_customer;
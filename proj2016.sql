DROP DATABASE IF EXISTS proj2016;
CREATE DATABASE proj2016;
USE proj2016;

create table users(
	account_id integer primary key,
	fullname varchar(32) not null,
	username varchar(16) not null,
	password varchar(32) not null,
	email varchar(64) not null,
	gender varchar(16) not null,
	age integer
);

create table customer_rep(
	account_id integer references users
);

create table admin(
	account_id integer references users
);

create table item(
	item_id integer primary key,
	title varchar(32) not null,
	author varchar(32) not null, 
	genre varchar(32) not null,
	isbn integer not null, 
	publisher varchar(32) not null, 
	year integer not null, 
	description text,
	item_cond varchar(16) not null
);


create table active_auction(
	auction_id integer primary key,
	start_date date not null, 
	end_date date not null, 
	reserve_price decimal(8,2), 
	current_price decimal(8,2) not null,
	start_price decimal(8,2) not null,
	item_id integer references item,
	seller_id integer references users
);

create table bid(
	bid_id integer primary key, 
	bid_price decimal(8,2) not null, 
	time timestamp not null, 
	bidder_id integer references users,
	auction_id integer references active_auction,
	item_id integer references item 
);

create table active_inventory(
	inventory_id integer primary key, 
	quantity integer not null,
	item_price integer not null, 
	item_id integer references item,
	selling_user integer references users
);


create table final_sales(
	sale_id integer primary key, 
	item_id integer references item,
	sale_date date not null, 
	sale_time timestamp not null,
	quantity integer not null, 
	sale_price decimal(8,2) not null, 
	seller_id integer references users,
	buyer_id integer references users
);

create table forum(

	forum_id integer primary key,
	asker_id integer references users,
	answer_id integer references users, 
	question text,
	answer text
);

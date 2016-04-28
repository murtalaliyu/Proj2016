drop table users;
create table users(
	account_id integer primary key,
	username varchar(16) not null,
	password varchar(32) not null,
	name varchar(32) not null,
	address varchar(64) not null,
	age integer not null
);

drop table customer_rep;
create table customer_rep(
	account_id integer references users
	
);

drop table admin;
create table admin(
	account_id integer references users

);

drop table item;
create table item(
	item_id integer primary key,
	title varchar(32) not null,
	author varchar(32) not null, 
	genre varchar(32) not null,
	isbn integer not null, 
	publisher varchar(32) not null, 
	year integer varchar(32) not null, 
	description text,
	item_cond varchar(16)

);


drop table active_auction;
create table active_auction(
	auction_id integer primary key,
	start_date date not null, 
	end_date date not null, 
	reserve_price decimal(8,2), 
	current_price decimal(8,2) not null,
	start_price decimal(8,2) not null,
	item_id integer references item,
	selling_user references users

);

drop table bid;
create table bid(
	bid_id integer primary key, 
	bid_price decimal(8,2) not null, 
	time timestamp not null, 
	bidder_id references users,
	auction_id references active_auction,
	item_id references item 

);

drop table active_inventory;
create table active_inventory(
	inventory_id integer primary key, 
	quantity integer not null,
	item_price integer not null, 
	item_id integer references item,
	selling_user references users

);


drop table final_sales;
create table final_sales(
	sale_id integer primary key, 
	item_id references item not null,
	sale_date date not null, 
	sale_time timestamp not null,
	quantity integer not null, 
	sale_price decimal(8,2) not null, 
	seller_id references users,
	buyer_id references users

);

drop table forum;
create table forum(

	forum_id integer primary key,
	asker_id references users,
	answer_id references users, 
	question text not null,
	answer text
	
);

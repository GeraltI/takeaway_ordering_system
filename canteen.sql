/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022/12/27 15:57:54                          */
/*==============================================================*/
use canteen;
/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null  primary key auto_increment,
   user_name            varchar(32) not null,
   user_password        varchar(16) not null,
   user_active          bool,
   user_create_time     datetime
);

insert into user values
(null,'admin','123456',true,now());
insert into user values
(null,'business1','123456',true,now());
insert into user values
(null,'business2','123456',true,now());
insert into user values
(null,'business3','123456',true,now());
insert into user values
(null,'client1','123456',true,now());
insert into user values
(null,'client2','123456',true,now());
insert into user values
(null,'client3','123456',true,now());
insert into user values
(null,'client4','123456',true,now());
insert into user values
(null,'client5','123456',true,now());

/*==============================================================*/
/* Index: user_id                                               */
/*==============================================================*/
create unique index user_id on user
(
   user_id
);

/*==============================================================*/
/* Index: user_name                                             */
/*==============================================================*/
create unique index user_name on user
(
   user_name
);
/*==============================================================*/
/* Table: business                                              */
/*==============================================================*/
create table business
(
   user_id              int not null,
   user_name            varchar(32) not null,
   business_id          int not null  primary key auto_increment,
   business_name        varchar(32),
   business_application text,
   foreign key(user_id) references user(user_id),
   foreign key(user_name) references user(user_name)
);

insert into business values
('2','business1',null,'?????????','??????');
insert into business values
('3','business2',null,'?????????','??????');
insert into business values
('4','business3',null,'?????????','??????');

/*==============================================================*/
/* Index: business_PK                                           */
/*==============================================================*/
create unique index business_PK on business
(
   business_id
);

/*==============================================================*/
/* Index: business_name                                         */
/*==============================================================*/
create index business_name on business
(
   business_name
);

/*==============================================================*/
/* Table: canteen                                               */
/*==============================================================*/
create table canteen
(
   canteen_id           int not null  primary key auto_increment,
   canteen_name         char(32),
   canteen_address      longtext,
   canteen_application  longtext
);

insert into canteen values
(null,'??????1','??????','?????????');
insert into canteen values
(null,'??????2','??????','??????');

/*==============================================================*/
/* Index: canteen_PK                                            */
/*==============================================================*/
create unique index canteen_PK on canteen
(
   canteen_id
);

/*==============================================================*/
/* Index: canteen_name                                          */
/*==============================================================*/
create index canteen_name on canteen
(
   canteen_name
);

/*==============================================================*/
/* Table: client                                                */
/*==============================================================*/
create table client
(
   user_id              int not null,
   user_name            varchar(32) not null,
   client_id            int not null primary key auto_increment ,
   client_name          varchar(32),
   client_sex           smallint,
   client_birth         date,
   client_hobby         longtext,
   client_address       longtext,
   client_contact       longtext,
   foreign key(user_id) references user(user_id),
   foreign key(user_name) references user(user_name)
);

insert into client values
('5','client1',null,'??????1','1','2012-12-31 11:30:45','','','');
insert into client values
('6','client2',null,'??????2','2','2013-12-31 11:30:45','','','');
insert into client values
('7','client3',null,'??????3','1','2014-12-31 11:30:45','','','');
insert into client values
('8','client4',null,'??????4','2','2015-12-31 11:30:45','','','');
insert into client values
('9','client5',null,'??????5','1','2016-12-31 11:30:45','','','');

/*==============================================================*/
/* Index: client_PK                                             */
/*==============================================================*/
create unique index client_PK on client
(
   client_id
);

/*==============================================================*/
/* Index: client_name                                           */
/*==============================================================*/
create index client_name on client
(
   client_name
);

/*==============================================================*/
/* Table: manager                                               */
/*==============================================================*/
create table manager
(
   user_id              int not null,
   user_name            varchar(32) not null,
   manager_id           int not null  primary key auto_increment,
   manager_name         varchar(32),
   foreign key(user_id) references user(user_id),
   foreign key(user_name) references user(user_name)
);

insert into manager values
('1','admin',null,'?????????1');

/*==============================================================*/
/* Index: manager_PK                                            */
/*==============================================================*/
create unique index manager_PK on manager
(
   manager_id
);

/*==============================================================*/
/* Index: manager_name                                          */
/*==============================================================*/
create index manager_name on manager
(
   manager_name
);

/*==============================================================*/
/* Table: restaurant                                            */
/*==============================================================*/
create table restaurant
(
   restaurant_id        int not null primary key auto_increment,
   canteen_id          int not null,
   business_id         int not null,
   restaurant_name      varchar(32) not null,
   restaurant_location  longtext,
   restaurant_application  longtext,
   foreign key(canteen_id) references canteen(canteen_id),
   foreign key(business_id) references business(business_id)
);

insert into restaurant values
(null,'1','1','??????1','??????1??????','???????????????1');
insert into restaurant values
(null,'2','2','??????2','??????2???','???????????????1');
insert into restaurant values
(null,'1','1','??????3','??????1???','???????????????2');
insert into restaurant values
(null,'2','2','??????4','??????2???','???????????????2');
insert into restaurant values
(null,'1','3','??????5','??????1???','???????????????1');

/*==============================================================*/
/* Index: restaurant_PK                                         */
/*==============================================================*/
create unique index restaurant_PK on restaurant
(
   restaurant_id
);

/*==============================================================*/
/* Index: canteen_restaurant_FK                                 */
/*==============================================================*/
create index canteen_restaurant_FK on restaurant
(
   canteen_id
);

/*==============================================================*/
/* Index: business_restaurant_FK                                */
/*==============================================================*/
create index business_restaurant_FK on restaurant
(
   business_id
);

/*==============================================================*/
/* Index: restaurant_name                                       */
/*==============================================================*/
create index restaurant_name on restaurant
(
   restaurant_name
);

/*==============================================================*/
/* Table: food                                                  */
/*==============================================================*/
create table food
(
   food_id              int not null primary key auto_increment,
   restaurant_id        int not null,
   food_name            varchar(32) not null,
   food_application     longtext,
   food_single_price    double not null,
   food_rest            smallint,
   foreign key(restaurant_id) references restaurant(restaurant_id)
);

insert into food values
(null,'1','???????????????',"??????",'8','55');
insert into food values
(null,'1','?????????',"??????",'18','66');
insert into food values
(null,'2','??????????????????',"??????",'15','77');
insert into food values
(null,'2','???????????????',"??????",'7','88');
insert into food values
(null,'3','???????????????',"??????",'17','55');
insert into food values
(null,'3','??????????????????',"??????",'19','66');
insert into food values
(null,'3','???????????????',"??????",'5','77');
insert into food values
(null,'4','????????????',"?????????",'22','88');
insert into food values
(null,'4','??????',"??????",'10','55');
insert into food values
(null,'4','??????',"??????",'10','66');
insert into food values
(null,'5','?????????',"??????",'20','77');
insert into food values
(null,'5','?????????',"????????????????????????",'25','88');

/*==============================================================*/
/* Index: food_PK                                               */
/*==============================================================*/
create unique index food_PK on food
(
   food_id
);

/*==============================================================*/
/* Index: restaurant_food_FK                                    */
/*==============================================================*/
create index restaurant_food_FK on food
(
   restaurant_id
);

/*==============================================================*/
/* Index: food_name                                             */
/*==============================================================*/
create index food_name on food
(
   food_name
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   order_id             bigint not null primary key auto_increment,
   client_id            int not null,
   restaurant_id        int not null,
   client_phone_number  char(12) not null,
   order_address        longtext not null,
   order_price          double not null,
   order_paid           bool,
   order_confirm        bool,
   order_finish         bool,
   order_create_time    datetime,
   order_finish_time    datetime,
   foreign key(client_id) references client(client_id),
   foreign key(restaurant_id) references restaurant(restaurant_id)
);

insert into orders values
(null,'1','1','15919296130','????????????','26',true,true,true,now(),now());
insert into orders values
(null,'1','1','15919296130','????????????','29',true,true,true,now(),now());

/*==============================================================*/
/* Index: order_PK                                              */
/*==============================================================*/
create unique index order_PK on orders
(
   order_id
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on orders
(
   client_id
);

/*==============================================================*/
/* Index: restaurant_order_FK                                   */
/*==============================================================*/
create index restaurant_order_FK on orders
(
   restaurant_id
);

/*==============================================================*/
/* Table: orders_food                                           */
/*==============================================================*/
create table orders_food
(
   order_id             bigint not null,
   food_id              int not null,
   food_number          smallint not null,
   foreign key(order_id) references orders(order_id),
   foreign key(food_id) references food(food_id)
);

insert into orders_food values
('1','1','1');
insert into orders_food values
('1','2','1');
insert into orders_food values
('2','3','1');
insert into orders_food values
('2','4','2');

/*==============================================================*/
/* Index: order_food_PK                                         */
/*==============================================================*/
create unique index order_food_PK on orders_food
(
   order_id,
   food_id
);

/*==============================================================*/
/* View: client_informatin                                      */
/*==============================================================*/
create VIEW  client_informatin
 as
select client.client_id,client.client_name,
       client.client_sex,client.client_birth,
       client.client_hobby,client.client_address,
       client.client_contact,sum(orders.order_price)
       
from   client,orders

where  orders.client_id = client.client_id

group by orders.order_id;

/*==============================================================*/
/* View: food_information                                       */
/*==============================================================*/
create VIEW  food_information
 as
select food.food_id,food.food_name,sum(food_number)

from   orders_food,food

where  orders_food.food_id = food.food_id

group by food.food_id;


create trigger orders_before_insert
before insert on orders
for each row 
set new.order_create_time = now() , new.order_paid = false 
, new.order_confirm = false , new.order_finish = false;

create trigger user_before_insert
before insert on user
for each row 
set new.user_active = true , new.user_create_time = now();


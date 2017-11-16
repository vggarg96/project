create table user(
email_id varchar(40) primary key,
fname varchar(30),
lname varchar(30),
password varchar(30),
age int,
gender varchar(10),
mobile int);

create table station(
station_id varchar(10) primary key,
station_name varchar(30));

create table train(
train_id int primary key,
train_name varchar(30),
train_type varchar(20),
availability integer,
days varchar(15),
dest_arriv_time time,
scr_depart_time time,
total_time time,
scr_id varchar(10),
foreign key(scr_id) references station(station_id) on delete cascade,
dest_id varchar(10),
foreign key(dest_id) references station(station_id) on delete cascade);

create table train_availability(
id int primary key,
train_id int,
foreign key(train_id) references train(train_id) on delete cascade);
seat_class_1 int,
seat_class_2 int,
seat_class_3 int,
seat_sleeper int,
seat_general int,
wait_seat_class1 int,
wait_seat_class2 int,
wait_seat_class3 int,
wait_seat_sleeper int,
avail_seat_class1 int,
avail_seat_class2 int,
avail_seat_class3 int,
avail_seat_sleeper int,
fare_class1 int,
fare_class2 int,
fare_class3 int,
fare_sleeper int,
fair_general int,
ondate date);


create table passenger(
pnr int primary key,
train_id int,
foreign key(train_id) references train(train_id) on delete cascade,
full_name varchar(20),
gender varchar(2),
age int,
seat_no int,
class varchar(10),
fair int,
scr_id varchar(10),
foreign key(scr_id) references station(station_id) on delete cascade,
dest_id varchar(10),
foreign key(dest_id) references station(station_id) on delete cascade);

create table route(
train_id int,
foreign key(train_id) references train(train_id) on delete cascade,
total_stop int,
scr_dist int,
dest_arriv_time time,
scr_depart_time time,
primary key(train_id,total_stop));


create table reservation(
email_id varchar(40),
foreign key (email_id) references user(email_id) on delete cascade,
pnr int,
foreign key (pnr) references passenger(pnr) on delete cascade,
train_id int,
foreign key (train_id) references train(train_id) on delete cascade,
train_name varchar(20),
res_status varchar(30),
res_date date,
scr_name varchar(30),
dest_name varchar(30),
primary key(email_id,pnr,train_id));


INSERTION OF DATA:
insert into user (email_id,fname,lname,password,age,gender) values
('aaditya.s010@gmail.com','aaditya','mijar','abcd',21,'m'),
('roy.1998rishav@gmail.com','rishav','roy','abcd',20,'m'),
('anupam.anand1928@gmail.com','anupam','anand','abcd',20,'m'),
('vg.vaibhav96@gmail.com','vaibhav','garg','abcd',21,'m');


insert into station (station_id,station_name) values
('BPL','bhopal'),
('KSR','bangalore'),
('NDLS','new delhi');


insert into train  (train_id,train_name,train_type,availability,days,dest_arriv_time,scr_depart_time,total_time,scr_id,dest_id) values
(22692,'bangalore rjdhani','rajdhani',7,'m,t,w,t,f,s,s','20:45:00','06:40:00','33:55:00','NDLS','KSR'),
(22691,'bangalore rjdhani','rajdhani',7,'m,t,w,t,f,s,s','20:00:00','05:55:00','33:55:00','KSR','NDLS'),
(12002,'shatapbdi express','shatapbdi',7,'m,t,w,t,f,s,s','06:00:00','13:50:00','07:50:00','NDLS','BPL'),
(12001,'shatapbdi express','shatapbdi',7,'m,t,w,t,f,s,s','15:15:00','23:30:00','08:15:00','BPL','NDLS'),
(12627,'karnataka express','superfast',7,'m,t,w,t,f,s,s','19:20:00','10:30:00','40:25:00','KSR','BPL'),
(12628,'karnataka express','superfast',7,'m,t,w,t,f,s,s','21:15:00','13:40:00','39:10:00','BPL','KSR'),
(12630,'sampakkranti express','superfast',2,'w,f','06:20:00','08:45:00','45:35:00','NDLS','KSR'),
(12649,'sampakkranti express','superfast',5,'m,w,f,s,s','09:15:00','22:00:00','35:15:00','KSR','NDLS');

insert into passenger(pnr,train_id,full_name,gender,age,seat_no,class,fair,scr_id,dest_id) values 
(12121210,12002,'anupam anand','m',20,41,'sleeper',220,'NDLS','BPL'),
(12121211,12002,'rishav roy','m',20,45,'3 tier AC',220,'NDLS','BPL'),
(12121212,12628,'vaibhav garg','m',21,15,'3 tier AC',2020,'BPL','KSR'),
(12121213,12628,'aaditya mijar','m',20,62,'sleeper',20,'BPL','KSR'),
(12121214,22692,'rishav roy','m',20,25,'3 tier AC',400,'NDLS','KSR');


insert into train_availability(id,
train_id,seat_class_1,seat_class_2,seat_class_3,seat_sleeper,seat_general,wait_seat_class1,wait_seat_class2,wait_seat_class3,wait_seat_sleeper,avail_seat_class1,avail_seat_class2,avail_seat_class3,avail_seat_sleeper,fare_class1,fare_class2,fare_class3,fare_sleeper,fair_general,ondate) values
(1,22692,70,70,70,70,70,0,0,0,0,45,12,20,40,2020,750,480,120,100,"2017-11-15"),
(2,22691,70,70,70,70,70,0,0,0,0,12,54,21,45,2020,750,480,120,100,"2017-11-15"),
(3,12001,70,70,70,70,70,0,0,0,0,36,54,12,63,2020,750,480,120,100,"2017-11-15"),
(4,12002,70,70,70,70,70,0,0,0,0,64,15,42,32,2020,750,480,120,100,"2017-11-15"),
(5,12628,70,70,70,70,70,0,0,0,0,32,62,12,0,2020,750,480,120,100,"2017-11-15"),
(6,12627,70,70,70,70,70,0,0,0,0,45,12,62,4,2020,750,480,120,100,"2017-11-15"),
(7,22692,70,70,70,70,70,0,0,0,0,45,23,61,0,2020,750,480,120,100,"2017-11-16"),
(8,22691,70,70,70,70,70,0,0,0,0,45,10,20,1,2020,750,480,120,100,"2017-11-16"),
(9,12001,70,70,70,70,70,0,0,0,0,45,12,62,32,2020,750,480,120,100,"2017-11-16"),
(10,12002,70,70,70,70,70,0,0,0,0,45,62,51,23,2020,750,480,120,100,"2017-11-16"),
(11,12628,70,70,70,70,70,0,0,0,0,40,12,51,23,2020,750,480,120,100,"2017-11-16"),
(12,12627,70,70,70,70,70,0,0,0,0,12,2,1,2,2020,750,480,120,100,"2017-11-16"),
(13,12630,70,70,70,70,70,0,0,0,0,45,32,62,4,2020,750,480,120,100,"2017-11-15"),
(14,12630,70,70,70,70,70,0,0,0,0,40,22,12,0,2020,750,480,120,100,"2017-11-16"),
(15,12649,70,70,70,70,70,0,0,0,0,54,32,12,9,2020,750,480,120,100,"2017-11-15"),
(16,12649,70,70,70,70,70,0,0,0,0,11,10,8,0,2020,750,480,120,100,"2017-11-16");

insert into route(train_id,total_stop,scr_dist,scr_depart_time,dest_arriv_time) values
(22691,15,2371,'20:00:00','05:55:00'),
(22692,14,2365,'20:45:00','06:40:00'),
(12002,10,701,'06:00:00','13:50:00'),
(12001,10,701,'15:15:00','23:30:00'),
(12628,35,2406,'21:15:00','13:40:00'),
(12627,36,2413,'19:20:00','10:30:00');



insert into reservation(email_id,pnr,train_id,train_name,res_status,res_date,scr_name,dest_name) values
('aaditya.s010@gmail.com',12121213,12628,'karnataka express','confirmed','2017-05-20','BPL','KSR'),
('roy.1998rishav@gmail.com',12121211,12002,'shatapbdi express','confirmed','2017-07-10','NDLS','BPL'),
('anupam.anand1928@gmail.com',12121210,12002,'shatapbdi express','confirmed','2017-06-12','NDLS','BPL'),
('vg.vaibhav96@gmail.com',12121212,12628,'karnataka express','confirmed','2017-05-16','BPL','KSR');


select * from user;
select * from station;
select * from train;
select * from passenger;
select * from route;
select * from train_status;
select * from reservation;

query:
1>
SELECT d1.train_name, d1.train_id
FROM train d1
INNER JOIN train d2 ON d2.train_id=d1.train_id
WHERE d1.scr_id = 'BPL' and d2.dest_id = 'GWL';

2>


3>

train id
train name
scr station
dest station
depture time 
arrival time
create database InsuranceDB;
use InsuranceDB;

create table PERSON (
    driver_id varchar(10) primary key,
    name varchar(50),
    address varchar(100)
);

create table CAR (
    reg_num varchar(15) primary key,
    model varchar(30),
    year int
);

create table OWNS (
    driver_id varchar(10),
    reg_num varchar(15),
    primary key (driver_id, reg_num),
    foreign key (driver_id) references PERSON(driver_id),
    foreign key (reg_num) references CAR(reg_num)
);

create table ACCIDENT (
    report_num int primary key,
    accident_date date,
    location varchar(100)
);

create table PARTICIPATED (
    driver_id varchar(10),
    reg_num varchar(15),
    report_num int,
    damage_amount int,
    primary key (driver_id, reg_num, report_num),
    foreign key (driver_id) references PERSON(driver_id),
    foreign key (reg_num) references CAR(reg_num),
    foreign key (report_num) references ACCIDENT(report_num)
);

insert into PERSON values
('A01','Richard','Srinivas Nagar'),
('A02','Pradeep','Rajaji Nagar'),
('A03','Smith','Ashok Nagar'),
('A04','Venul','N R Colony'),
('A05','Jhon','Hanumanth Nagar');

insert into CAR values
('KA052250','Indica',1990),
('KA031181','Lancer',1957),
('KA095477','Toyota',1998),
('KA053408','Honda',2008),
('KA041702','Audi',2005);

insert into OWNS values
('A01','KA052250'),
('A02','KA053408'),
('A03','KA031181'),
('A04','KA095477'),
('A05','KA041702');

insert into ACCIDENT values
(11,'2003-01-01','Mysore Road'),
(12,'2004-02-02','South End Circle'),
(13,'2003-01-21','Bull Temple Road'),
(14,'2008-02-17','Mysore Road'),
(15,'2005-03-04','Kanakapura Road');

insert into PARTICIPATED values
('A01','KA052250',11,10000),
('A02','KA053408',12,50000),
('A03','KA095477',13,25000),
('A04','KA031181',14,3000),
('A05','KA041702',15,5000);

-- queries
update PARTICIPATED set damage_amount = 25000 where reg_num = 'KA053408' and report_num = 12;
insert into ACCIDENT values (16, '2026-09-29', 'BTM Layout');
select accident_date, location from ACCIDENT;
select driver_id from PARTICIPATED where damage_amount >= 25000;
select * from ACCIDENT;
select p.name, pt.reg_num, pt.damage_amount from PERSON p join PARTICIPATED pt on p.driver_id = pt.driver_id;
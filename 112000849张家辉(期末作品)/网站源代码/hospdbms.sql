create database hospital_database;

show databases;

use hospital_database;

create table patients_info 
(
name varchar(20) NOT null,
email varchar(30),
contact_no numeric(10),
street varchar(50),
locality varchar(20),
aadhar varchar(12) PRIMARY KEY,
state varchar(20),
country varchar(20),
password varchar(25)
);

create table doc_info
(
dname varchar(20),
dspec varchar(20),
psswd varchar(20)
);

create table apn_info 
(
pname varchar(20),
dname varchar(20),
spec varchar(20),
apdate date,
aptime time
);


insert into patients_info values('123','123',1234567890,'1','1','1','a','1','123');
insert into doc_info values('医生1','心脏手术','123');
insert into doc_info values('医生2','脑部手术','123');
insert into apn_info values('123','医生1','心脏手术','2022/02/11','22:22:22');
select * from patients_info;
select * from doc_info;
select * from apn_info;
/*==============================================================*/
/* Database name:  diary                                        */
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/1/2 19:56:36                            */
/*==============================================================*/


drop database if exists diary;

/*==============================================================*/
/* Database: diary                                              */
/*==============================================================*/
create database diary;

use diary;

/*==============================================================*/
/* Table: diary                                                 */
/*==============================================================*/
create table diary
(
   diary_id             int(11) not null auto_increment,
   user_id              int(11) not null,
   date_of_diary        datetime not null,
   content              text not null,
   visibility           bit,
   primary key (diary_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int(11) not null auto_increment,
   first_name           varchar(50) not null,
   last_name            varchar(50) not null,
   email                varchar(100) not null,
   password             varchar(32) not null,
   primary key (user_id),
   unique key email (email)
);


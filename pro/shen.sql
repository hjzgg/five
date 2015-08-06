/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015-5-18 15:17:39                           */
/*==============================================================*/


drop table if exists consignee;

drop table if exists goods;

drop table if exists merchant;

drop table if exists orders;

drop table if exists remark;

drop table if exists shopping;

drop table if exists users;

/*==============================================================*/
/* Table: consignee                                             */
/*==============================================================*/
create table consignee
(
   cid                  int not null auto_increment,
   uid                  int,
   cname                varchar(10) not null,
   caddr                varchar(50) not null,
   ctel                 varchar(20) not null,
   cpostcode            varchar(10) not null,
   primary key (cid)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   gid                  int not null auto_increment,
   mid                  int,
   gname                varchar(10) not null,
   gtype                int not null,
   gkindcode            int not null,
   gprice               varchar(10) not null,
   ghot                 int not null,
   gsales               int not null,
   gtime                varchar(50) not null,
   gimg                 varchar(100) not null,
   gnum                 varchar(10) not null,
   gcount               varchar(10),
   gdetail              varchar(50),
   primary key (gid)
);

/*==============================================================*/
/* Table: merchant                                              */
/*==============================================================*/
create table merchant
(
   mid                  int not null auto_increment,
   mname                varchar(20) not null,
   mtel                 varchar(20) not null,
   matype               int not null,
   maddr                varchar(50) not null,
   mimg                 varchar(100) not null,
   mdetail              varchar(50),
   primary key (mid)
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   oid                  int not null auto_increment,
   cid                  int,
   otime                varchar(100) not null,
   ostatus              int,
   primary key (oid)
);

/*==============================================================*/
/* Table: remark                                                */
/*==============================================================*/
create table remark
(
   rid                  int not null auto_increment,
   gid                  int,
   uid                  int,
   rcon                 varchar(100) not null,
   rtime                varchar(20) not null,
   primary key (rid)
);

/*==============================================================*/
/* Table: shopping                                              */
/*==============================================================*/
create table shopping
(
   sid                  int not null auto_increment,
   gid                  int,
   oid                  int,
   snum                 int not null,
   primary key (sid)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   uid                  int not null auto_increment,
   username             varchar(20) not null,
   password             varchar(20) not null,
   QQ                   varchar(20),
   email                varchar(20),
   birth                varchar(10),
   primary key (uid)
);

alter table consignee add constraint FK_consigneewuser foreign key (uid)
      references users (uid) on delete restrict on update restrict;

alter table goods add constraint FK_goodswshopping foreign key (mid)
      references merchant (mid) on delete restrict on update restrict;

alter table orders add constraint FK_orderswconsignee foreign key (cid)
      references consignee (cid) on delete restrict on update restrict;

alter table remark add constraint FK_remarkwgoods foreign key (gid)
      references goods (gid) on delete restrict on update restrict;

alter table remark add constraint FK_remarkwuser foreign key (uid)
      references users (uid) on delete restrict on update restrict;

alter table shopping add constraint FK_shoppingwgoods foreign key (gid)
      references goods (gid) on delete restrict on update restrict;

alter table shopping add constraint FK_shoppingworders foreign key (oid)
      references orders (oid) on delete restrict on update restrict;


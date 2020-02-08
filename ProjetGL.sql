/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     08/02/2020 23:15:28                          */
/*==============================================================*/


drop trigger Trigger_1;

drop table if exists Bug;

drop table if exists Discussion;

drop table if exists Message;

drop table if exists Signal_;

drop table if exists joueur;

drop table if exists probleme;

drop table if exists rapport;

drop table if exists suspendre;

/*==============================================================*/
/* Table: Bug                                                   */
/*==============================================================*/
create table Bug
(
   id_bug               int not null auto_increment,
   id_rapport           int,
   id_probleme          int,
   primary key (id_bug)
);

/*==============================================================*/
/* Table: Discussion                                            */
/*==============================================================*/
create table Discussion
(
   id_discussion        int not null auto_increment,
   id_joueur_1          int not null,
   id_joueur_2          int not null,
   id_message           int,
   primary key (id_discussion)
);

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message
(
   id_message           int not null auto_increment,
   id_joueur            int,
   id_discussion        int,
   message              varchar(500),
   time_send            datetime,
   time_vu              datetime,
   primary key (id_message)
);

/*==============================================================*/
/* Table: Signal_                                               */
/*==============================================================*/
create table Signal_
(
   id_signal            int not null auto_increment,
   id_joueur_signal     int,
   id_rapport           int,
   primary key (id_signal)
);

/*==============================================================*/
/* Table: joueur                                                */
/*==============================================================*/
create table joueur
(
   id_joueur            int not null auto_increment,
   username             varchar(50),
   password             varchar(50),
   friends              text,
   primary key (id_joueur)
);

/*==============================================================*/
/* Table: probleme                                              */
/*==============================================================*/
create table probleme
(
   id_probleme          int not null auto_increment,
   nom                  varchar(200),
   primary key (id_probleme)
);

/*==============================================================*/
/* Table: rapport                                               */
/*==============================================================*/
create table rapport
(
   id_rapport           int not null auto_increment,
   id_joueur            int,
   description          varchar(500),
   date_send            datetime,
   primary key (id_rapport)
);

/*==============================================================*/
/* Table: suspendre                                             */
/*==============================================================*/
create table suspendre
(
   id_suspendre         int not null auto_increment,
   id_signal            int,
   id_joueur            int,
   date_debut           datetime,
   date_fin             datetime,
   primary key (id_suspendre)
);

alter table Bug add constraint FK_Reference_10 foreign key (id_probleme)
      references probleme (id_probleme) on delete restrict on update restrict;

alter table Bug add constraint FK_Reference_7 foreign key (id_rapport)
      references rapport (id_rapport) on delete restrict on update restrict;

alter table Discussion add constraint FK_Reference_3 foreign key (id_joueur_1)
      references joueur (id_joueur) on delete restrict on update restrict;

alter table Discussion add constraint FK_Reference_4 foreign key (id_joueur_2)
      references joueur (id_joueur) on delete restrict on update restrict;

alter table Discussion add constraint FK_Reference_5 foreign key (id_message)
      references Message (id_message) on delete set null on update restrict;

alter table Message add constraint FK_Reference_1 foreign key (id_joueur)
      references joueur (id_joueur) on delete restrict on update restrict;

alter table Message add constraint FK_Reference_13 foreign key (id_discussion)
      references Discussion (id_discussion) on delete restrict on update restrict;

alter table Signal_ add constraint FK_Reference_8 foreign key (id_joueur_signal)
      references joueur (id_joueur) on delete restrict on update restrict;

alter table Signal_ add constraint FK_Reference_9 foreign key (id_rapport)
      references rapport (id_rapport) on delete restrict on update restrict;

alter table rapport add constraint FK_Reference_6 foreign key (id_joueur)
      references joueur (id_joueur) on delete restrict on update restrict;

alter table suspendre add constraint FK_Reference_11 foreign key (id_signal)
      references Signal_ (id_signal) on delete restrict on update restrict;

alter table suspendre add constraint FK_Reference_12 foreign key (id_joueur)
      references joueur (id_joueur) on delete restrict on update restrict;


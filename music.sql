/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  06/03/2017 20:45:56                      */
/*==============================================================*/


/*==============================================================*/
/* Table : ALBUM                                                */
/*==============================================================*/
create table ALBUM (
   IDALBUM              INT4                 not null,
   IDARTISTE            INT4                 not null,
   NOMALBUM             VARCHAR(50)          not null,
   constraint PK_ALBUM primary key (IDALBUM)
);

/*==============================================================*/
/* Index : ALBUM_PK                                             */
/*==============================================================*/
create unique index ALBUM_PK on ALBUM (
IDALBUM
);

/*==============================================================*/
/* Index : INTERPRETE_FK                                        */
/*==============================================================*/
create  index INTERPRETE_FK on ALBUM (
IDARTISTE
);

/*==============================================================*/
/* Table : ARTISTE                                              */
/*==============================================================*/
create table ARTISTE (
   IDARTISTE            INT4                 not null,
   NOMARTISTE           VARCHAR(30)          not null,
   constraint PK_ARTISTE primary key (IDARTISTE)
);

/*==============================================================*/
/* Index : ARTISTE_PK                                           */
/*==============================================================*/
create unique index ARTISTE_PK on ARTISTE (
IDARTISTE
);

/*==============================================================*/
/* Table : CHANSON                                              */
/*==============================================================*/
create table CHANSON (
   IDCHANSON            INT4                 not null,
   IDALBUM              INT4                 not null,
   TITRE                VARCHAR(50)          not null,
   ARTISTECHANSON       VARCHAR(50)          not null,
   ANNEE                INT4                 not null,
   constraint PK_CHANSON primary key (IDCHANSON)
);

/*==============================================================*/
/* Index : CHANSON_PK                                           */
/*==============================================================*/
create unique index CHANSON_PK on CHANSON (
IDCHANSON
);

/*==============================================================*/
/* Index : CHANSONALBUM_FK                                      */
/*==============================================================*/
create  index CHANSONALBUM_FK on CHANSON (
IDALBUM
);

/*==============================================================*/
/* Table : CHANSONHUMEUR                                        */
/*==============================================================*/
create table CHANSONHUMEUR (
   IDCHANSONHUMEUR      INT4                 not null,
   IDCHANSON            INT4                 not null,
   IDHUMEUR             INT4                 not null,
   constraint PK_CHANSONHUMEUR primary key (IDCHANSONHUMEUR)
);

/*==============================================================*/
/* Index : CHANSONHUMEUR_PK                                     */
/*==============================================================*/
create unique index CHANSONHUMEUR_PK on CHANSONHUMEUR (
IDCHANSONHUMEUR
);

/*==============================================================*/
/* Index : CHANSONHUMEUR_FK                                     */
/*==============================================================*/
create  index CHANSONHUMEUR_FK on CHANSONHUMEUR (
IDCHANSON
);

/*==============================================================*/
/* Index : CHANSONHUMEUR2_FK                                    */
/*==============================================================*/
create  index CHANSONHUMEUR2_FK on CHANSONHUMEUR (
IDHUMEUR
);

/*==============================================================*/
/* Table : HISTORIQUEHUMEUR                                     */
/*==============================================================*/
create table HISTORIQUEHUMEUR (
   IDHISTORIQUEHUMEUR   INT4                 not null,
   IDHUMEUR             INT4                 not null,
   IDUTILISATEUR        INT4                 not null,
   DATEAJOUT            DATE                 not null,
   HEUREAJOUT           TIME                 not null,
   constraint PK_HISTORIQUEHUMEUR primary key (IDHISTORIQUEHUMEUR)
);

/*==============================================================*/
/* Index : HISTORIQUEHUMEUR_PK                                  */
/*==============================================================*/
create unique index HISTORIQUEHUMEUR_PK on HISTORIQUEHUMEUR (
IDHISTORIQUEHUMEUR
);

/*==============================================================*/
/* Index : HISTORIQUEHUMEUR_FK                                  */
/*==============================================================*/
create  index HISTORIQUEHUMEUR_FK on HISTORIQUEHUMEUR (
IDHUMEUR
);

/*==============================================================*/
/* Index : HISTORIQUEHUMEUR2_FK                                 */
/*==============================================================*/
create  index HISTORIQUEHUMEUR2_FK on HISTORIQUEHUMEUR (
IDUTILISATEUR
);

/*==============================================================*/
/* Table : HUMEUR                                               */
/*==============================================================*/
create table HUMEUR (
   IDHUMEUR             INT4                 not null,
   DESIGNATION          VARCHAR(20)          not null,
   constraint PK_HUMEUR primary key (IDHUMEUR)
);

/*==============================================================*/
/* Index : HUMEUR_PK                                            */
/*==============================================================*/
create unique index HUMEUR_PK on HUMEUR (
IDHUMEUR
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR (
   IDUTILISATEUR        INT4                 not null,
   NOM                  VARCHAR(50)          not null,
   PRENOM               VARCHAR(50)          not null,
   PSEUDO               VARCHAR(20)          not null,
   MOTDEPASSE           VARCHAR(20)          not null,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
);

/*==============================================================*/
/* Index : UTILISATEUR_PK                                       */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
IDUTILISATEUR
);

alter table ALBUM
   add constraint FK_ALBUM_INTERPRET_ARTISTE foreign key (IDARTISTE)
      references ARTISTE (IDARTISTE)
      on delete restrict on update restrict;

alter table CHANSON
   add constraint FK_CHANSON_CHANSONAL_ALBUM foreign key (IDALBUM)
      references ALBUM (IDALBUM)
      on delete restrict on update restrict;

alter table CHANSONHUMEUR
   add constraint FK_CHANSONH_CHANSONHU_CHANSON foreign key (IDCHANSON)
      references CHANSON (IDCHANSON)
      on delete restrict on update restrict;

alter table CHANSONHUMEUR
   add constraint FK_CHANSONH_CHANSONHU_HUMEUR foreign key (IDHUMEUR)
      references HUMEUR (IDHUMEUR)
      on delete restrict on update restrict;

alter table HISTORIQUEHUMEUR
   add constraint FK_HISTORIQ_HISTORIQU_HUMEUR foreign key (IDHUMEUR)
      references HUMEUR (IDHUMEUR)
      on delete restrict on update restrict;

alter table HISTORIQUEHUMEUR
   add constraint FK_HISTORIQ_HISTORIQU_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
      on delete restrict on update restrict;


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     06/05/2017 12:43:54                          */
/*==============================================================*/


drop table if exists CIUDAD;

drop table if exists DETALLE_PEDIDO;

drop table if exists DETALLE_PROVEEDOR;

drop table if exists FACTURA;

drop table if exists FORMA_PAGO;

drop table if exists PAIS;

drop table if exists PEDIDO;

drop table if exists PRODUCTO;

drop table if exists PRODUCTO_PROVEEDOR;

drop table if exists PROVEEDOR;

drop table if exists PROVINCIA;

drop table if exists VALOR_PRODUCTO;

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD
(
   COD_CIUDAD           char(5) not null,
   COD_PROVINCIA        char(5) not null,
   NOMBRE               varchar(40) not null,
   primary key (COD_CIUDAD)
);

/*==============================================================*/
/* Table: DETALLE_PEDIDO                                        */
/*==============================================================*/
create table DETALLE_PEDIDO
(
   COD_PRODUCTO         char(15) not null,
   NUM_PEDIDO           char(15) not null,
   CANTIDAD             numeric(8,0) not null,
   PRECIO               numeric(8,0) not null,
   IVA                  decimal(3,2) not null,
   primary key (COD_PRODUCTO, NUM_PEDIDO)
);

/*==============================================================*/
/* Table: DETALLE_PROVEEDOR                                     */
/*==============================================================*/
create table DETALLE_PROVEEDOR
(
   ID                   blob not null,
   NIT                  char(15) not null,
   COD_CIUDAD           char(5) not null,
   DIRECCION            varchar(50) not null,
   TELEFONO             char(15) not null,
   EMAIL                varchar(30) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   NUM_FACTURA          char(15) not null,
   COD_FORMA_PAGO       char(5) not null,
   NUM_PEDIDO           char(15) not null,
   ESTADO               char(15) not null,
   FECHA                datetime not null,
   OBSERVACIONES        varchar(60),
   primary key (NUM_FACTURA)
);

/*==============================================================*/
/* Table: FORMA_PAGO                                            */
/*==============================================================*/
create table FORMA_PAGO
(
   COD_FORMA_PAGO       char(5) not null,
   DESCRIPCION          varchar(30) not null,
   primary key (COD_FORMA_PAGO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS
(
   COD_PAIS             char(10) not null,
   NOMBRE               varchar(40) not null,
   primary key (COD_PAIS)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO
(
   NUM_PEDIDO           char(15) not null,
   NIT                  char(15) not null,
   FECHA                datetime not null,
   primary key (NUM_PEDIDO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   COD_PRODUCTO         char(15) not null,
   NOMBRE               char(20) not null,
   DESCRIPCION          varchar(30) not null,
   primary key (COD_PRODUCTO)
);

/*==============================================================*/
/* Table: PRODUCTO_PROVEEDOR                                    */
/*==============================================================*/
create table PRODUCTO_PROVEEDOR
(
   PRODUCTO             char(15) not null,
   PROVEEDOR            char(15) not null,
   primary key (PRODUCTO, PROVEEDOR)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   NIT                  char(15) not null,
   NOMBRE               char(30) not null,
   primary key (NIT)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA
(
   COD_PROVINCIA        char(5) not null,
   COD_PAIS             char(10) not null,
   NOMBRE               varchar(40) not null,
   primary key (COD_PROVINCIA)
);

/*==============================================================*/
/* Table: VALOR_PRODUCTO                                        */
/*==============================================================*/
create table VALOR_PRODUCTO
(
   PRODUCTO             char(15) not null,
   FECHA_ASIGNACION     datetime not null,
   PRECIO               numeric(8,0) not null,
   IVA                  decimal(3,2) not null,
   ACTIVO               char(1) not null,
   primary key (PRODUCTO, FECHA_ASIGNACION)
);

alter table CIUDAD add constraint FK_RELATIONSHIP_4 foreign key (COD_PROVINCIA)
      references PROVINCIA (COD_PROVINCIA) on delete restrict on update restrict;

alter table DETALLE_PEDIDO add constraint FK_RELATIONSHIP_10 foreign key (NUM_PEDIDO)
      references PEDIDO (NUM_PEDIDO) on delete restrict on update restrict;

alter table DETALLE_PEDIDO add constraint FK_RELATIONSHIP_9 foreign key (COD_PRODUCTO)
      references PRODUCTO (COD_PRODUCTO) on delete restrict on update restrict;

alter table DETALLE_PROVEEDOR add constraint FK_RELATIONSHIP_6 foreign key (NIT)
      references PROVEEDOR (NIT) on delete restrict on update restrict;

alter table DETALLE_PROVEEDOR add constraint FK_RELATIONSHIP_7 foreign key (COD_CIUDAD)
      references CIUDAD (COD_CIUDAD) on delete restrict on update restrict;

alter table FACTURA add constraint FK_RELATIONSHIP_11 foreign key (COD_FORMA_PAGO)
      references FORMA_PAGO (COD_FORMA_PAGO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_RELATIONSHIP_12 foreign key (NUM_PEDIDO)
      references PEDIDO (NUM_PEDIDO) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_RELATIONSHIP_8 foreign key (NIT)
      references PROVEEDOR (NIT) on delete restrict on update restrict;

alter table PRODUCTO_PROVEEDOR add constraint FK_RELATIONSHIP_1 foreign key (PRODUCTO)
      references PRODUCTO (COD_PRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO_PROVEEDOR add constraint FK_RELATIONSHIP_2 foreign key (PROVEEDOR)
      references PROVEEDOR (NIT) on delete restrict on update restrict;

alter table PROVINCIA add constraint FK_RELATIONSHIP_5 foreign key (COD_PAIS)
      references PAIS (COD_PAIS) on delete restrict on update restrict;

alter table VALOR_PRODUCTO add constraint FK_RELATIONSHIP_3 foreign key (PRODUCTO)
      references PRODUCTO (COD_PRODUCTO) on delete restrict on update restrict;


# --- !Ups 

create sequence document_identity;
create sequence group_identity;
create sequence schema_identity;
create sequence view_identity;
create sequence account_identity;
create sequence membership_identity;

create sequence document_version;
create sequence group_version;
create sequence schema_version;
create sequence view_version;
create sequence account_version;
create sequence membership_version;

create sequence viewing_sequence;

create sequence large_data_sequence;

CREATE TABLE i_account (
    name varchar(255) NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (name)
);

create table v_account (
    name varchar(255) NOT NULL,
    version bigint not null,
    audit text not null,
    email varchar(255) not null,  
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (name, version)
);


CREATE TABLE i_membership (
    account_name varchar(255) NOT NULL,
    group_name varchar(255) NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (account_name, group_name)
);

CREATE TABLE v_membership (
    account_name varchar(255) NOT NULL,
    group_name varchar(255) NOT NULL,
    version bigint not null,
    data text not null,  
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (account_name, group_name,version)
);


CREATE TABLE i_group (
    name varchar(255) NOT NULL,
    version bigint not null, 
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (name)
);

create table v_group (
    name varchar(255) NOT NULL,
    version bigint not null,
    audit text not null,  
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (name, version)
 );


CREATE TABLE i_schema (
    id bigint NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (id)
);

create table v_schema (
    id bigint NOT NULL,
    version bigint not null,
	group_name varchar(255) not null,
    audit text not null,  
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (id, version)
 );



 CREATE TABLE i_document (
    id bigint NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (id)
);

 CREATE TABLE v_document (
    id bigint NOT NULL,
    version bigint not null,
    group_id varchar(255) NOT NULL, 
    group_version bigint NOT NULL, 
    customer_key text not null,
    subject text not null,
    digest varchar(255) not null,
    kyc_email varchar(255),
    audit text not null,  
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (id, version)
);


create table viewing (
  id bigint primary key default nextval('viewing_sequence'),
  viewing_ip varchar(20) not null,
  viewing_time bigint not null,
  email text,
  url text not null,
  parameters text ,
  user_agent text );

CREATE TABLE CRYPTO( 
   id bigint NOT NULL,
   store bytea  NULL,
   primary key(id)
);

create table document_document_link (
   main bigint not null,
   secondary bigint not null,
   primary key (main,secondary)
);

create table large_data(
   id bigint not null default nextval('large_data_sequence'),
   data text not null,
   primary key(id)
);

# --- !Downs 
 
#drop table play_evolutions;

DROP TABLE i_document; 
DROP TABLE v_document;

DROP TABLE i_schema;
DROP TABLE v_schema;

drop table i_view;
drop table v_view;

drop table i_account;
drop table v_account;

drop table i_membership;
drop table v_membership;

DROP TABLE i_group;
DROP TABLE v_group; 

drop table CRYPTO;

drop table viewing;

drop table large_data;

drop table document_document_link;

DROP sequence document_identity cascade;
DROP sequence document_version cascade;

DROP sequence schema_identity cascade;
DROP sequence schema_version cascade;

DROP sequence group_identity cascade; 
DROP sequence group_version cascade; 

DROP sequence view_identity cascade; 
DROP sequence view_version cascade; 

DROP sequence account_identity cascade; 
DROP sequence account_version cascade; 

DROP sequence membership_identity cascade; 
DROP sequence membership_version cascade; 

DROP sequence viewing_sequence cascade; 
drop sequence large_data_sequence;

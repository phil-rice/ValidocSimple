# --- !Ups 

CREATE TABLE i_code (
    id bigint NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (id)
);

create table v_code (
    id bigint NOT NULL,
    version bigint not null,
    group_name varchar(255) not null,
    audit text not null,  
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (id, version)
 );
 
CREATE TABLE i_issued_code (
    id bigint NOT NULL,
    version bigint not null,
    audit text not null,  
    signature text NOT NULL,
    PRIMARY KEY (id)
);

create table v_issued_code (
    id bigint NOT NULL,
    version bigint not null,
    group_name varchar(255) not null,
    audit text not null,  
    code_number bigint not null,
	data text not null,
	deleted boolean,
    signature text NOT NULL,
    PRIMARY KEY (id, version)
 );

create sequence code_identity;
create sequence issued_code_identity;

create sequence code_version;
create sequence issued_code_version;

# --- !Downs 
 
drop table i_code;
drop table v_code;
drop sequence code_identity;
drop sequence code_version;

drop table i_issued_code;
drop table v_issued_code;
drop sequence issued_code_identity;
drop sequence issued_code_version;



# --- !Ups 
truncate i_code;
truncate v_code;

alter table i_code drop constraint if exists i_code_pkey;
alter table i_code add column group_name varchar(255);
alter table i_code add primary key (group_name,id);

alter table v_code drop constraint if exists v_code_pkey;
alter table v_code add primary key (group_name,id,version);

alter table i_issued_code drop constraint if exists i_issued_code_pkey;
alter table i_issued_code add column group_name varchar(255);
alter table i_issued_code add primary key (group_name,id);

alter table v_issued_code drop constraint if exists v_issued_code_pkey;
alter table v_issued_code add primary key (group_name,id,version);

CREATE TABLE code_group_sequence (
    group_name varchar(255) not null,
    next_id bigint not null,
    PRIMARY KEY (group_name)
);


# --- !Downs 
 
alter table i_code drop constraint if exists i_code_pkey;
alter table i_code drop column group_name ;
alter table i_code add primary key (id);

alter table v_code drop constraint if exists v_code_pkey;
alter table v_code add primary key (group_name,id);

alter table i_issued_code drop constraint if exists i_issued_code_pkey;
alter table i_issued_code drop column group_name ;
alter table i_issued_code add primary key (id);

alter table v_issued_code drop constraint if exists v_issued_code_pkey;
alter table v_issued_code add primary key (group_name,id);

drop table code_group_sequence;
 
# --- !Ups 

CREATE TABLE group_identity_setting (
    group_name varchar(255) not null,
    customer_ref varchar(255) not null,
    magic_string varchar(255) not null,
    ts timestamp default now(),
    who varchar(255) not null
);

create index on group_identity_setting (group_name, customer_ref);

# --- !Downs 
 
drop table group_identity_setting;
 
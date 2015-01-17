# --- !Ups 

CREATE TABLE dummy_secret(
    group_name varchar(255) not null,
    member varchar(255) not null,
    secret varchar(255) not null
);


# --- !Downs 
 
drop table dummy_secret;
 
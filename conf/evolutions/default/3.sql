# --- !Ups 

create sequence event_log_id;

CREATE TABLE event_log(
  id bigint NOT NULL  DEFAULT nextval('event_log_id'),
  ts timestamp without time zone default (now() at time zone 'utc'),
  email text,
  ip text,
  url text,
  message text,
  extra text,
  primary key(id)
);


# --- !Downs 
 
drop table event_log;

drop sequence event_log_id;




# --- !Ups 

create index document_group_id_index on v_document( group_id);


# --- !Downs 
 
drop index document_group_id_index;




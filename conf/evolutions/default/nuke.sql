drop table play_evolutions;

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

drop table event_log; 

drop table code_group_sequence;



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

drop sequence event_log_id;


drop table i_code;
drop table v_code;
drop sequence code_identity;
drop sequence code_version;

drop table i_issued_code;
drop table v_issued_code;
drop sequence issued_code_identity;
drop sequence issued_code_version;

drop table group_identity_setting;

drop table dummy_secret;
 
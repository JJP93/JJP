

CREATE TABLE PDINFO 
(
  PDNUM NUMBER NOT NULL 
, PDNAME VARCHAR2(20 BYTE) 
, COUNTPD NUMBER 
, CATEGORY NUMBER 
, PRICE NUMBER 
, IMG VARCHAR2(20 BYTE) 
, INFO VARCHAR2(100 BYTE) 
, COLOR VARCHAR2(20 BYTE) 
, PDSIZE VARCHAR2(20 BYTE) 
); 

create SEQUENCE pdinfo_num;
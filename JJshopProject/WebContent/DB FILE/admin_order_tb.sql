--------------------------------------------------------
--  파일이 생성됨 - 수요일-7월-05-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORDER_TB
--------------------------------------------------------

  CREATE TABLE "ADMIN"."ORDER_TB" 
   (	"ORNUM" NUMBER(*,0), 
	"PDNUM" NUMBER(*,0), 
	"ORNAME" VARCHAR2(50 BYTE), 
	"ORPRICE" NUMBER(*,0), 
	"ORSIZE" VARCHAR2(20 BYTE), 
	"ORCNT" NUMBER(*,0), 
	"ORCOLOR" VARCHAR2(20 BYTE), 
	"ORUSER" VARCHAR2(30 BYTE), 
	"ORDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"ORADDR" VARCHAR2(100 BYTE),
	"category" Number,
	"Img" Varchar2(50)
   ) ;
   
   create SEQUENCE order_num;


--------------------------------------------------------
--  파일이 생성됨 - 일요일-9월-15-2013   
--------------------------------------------------------
DROP TABLE "VAPS"."BOARD" cascade constraints;
DROP TABLE "VAPS"."ITEMS" cascade constraints;
DROP TABLE "VAPS"."ITEMSTORED" cascade constraints;
DROP TABLE "VAPS"."MEMBERS" cascade constraints;
DROP SYNONYM "VAPS"."B";
DROP SYNONYM "VAPS"."M";
DROP SEQUENCE "VAPS"."BOARD_SEQ";
DROP SEQUENCE "VAPS"."ITEM_SEQ";
DROP VIEW "VAPS"."BLIST";
DROP VIEW "VAPS"."BLISTDESC";
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VAPS"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ITEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VAPS"."ITEM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "VAPS"."BOARD" 
   (	"B_NUM" NUMBER, 
	"B_ID" NVARCHAR2(20), 
	"B_SUB" NVARCHAR2(50), 
	"B_CONTENTS" NCLOB, 
	"B_DATE" DATE DEFAULT SYSDATE, 
	"B_READCOUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("B_CONTENTS") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ITEMS
--------------------------------------------------------

  CREATE TABLE "VAPS"."ITEMS" 
   (	"I_NUM" NUMBER, 
	"I_NAME" NVARCHAR2(100), 
	"I_CATEGORY" NVARCHAR2(100), 
	"I_PRICE" NUMBER DEFAULT 0, 
	"I_PIC" NVARCHAR2(100), 
	"I_DESCRIPTION" NCLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("I_DESCRIPTION") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ITEMSTORED
--------------------------------------------------------

  CREATE TABLE "VAPS"."ITEMSTORED" 
   (	"IS_NAME" NVARCHAR2(100), 
	"IS_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE "VAPS"."MEMBERS" 
   (	"M_ID" NVARCHAR2(20), 
	"M_NICK" NVARCHAR2(20), 
	"M_PWD" NVARCHAR2(20), 
	"M_PHONE" NVARCHAR2(20), 
	"M_ADDR" NVARCHAR2(20), 
	"M_POINT" NUMBER(20,0) DEFAULT '0', 
	"M_AUTH" NUMBER DEFAULT '0'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View BLIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VAPS"."BLIST" ("B_NO", "B_NUM", "B_ID", "M_NICK", "B_SUB", "B_CONTENTS", "B_DATE", "B_READCOUNT") AS 
  SELECT ROWNUM AS B_NO, 
            B_NUM,
            B_ID,
            M_NICK,
            B_SUB,
            B_CONTENTS,
            B_DATE,
            B_READCOUNT
FROM BLISTDESC;
--------------------------------------------------------
--  DDL for View BLISTDESC
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VAPS"."BLISTDESC" ("B_NUM", "B_ID", "B_SUB", "B_CONTENTS", "B_DATE", "B_READCOUNT", "M_ID", "M_NICK", "M_PWD", "M_PHONE", "M_ADDR", "M_POINT", "M_AUTH") AS 
  SELECT "B_NUM","B_ID","B_SUB","B_CONTENTS","B_DATE","B_READCOUNT","M_ID","M_NICK","M_PWD","M_PHONE","M_ADDR","M_POINT","M_AUTH"
FROM B INNER JOIN M ON B.B_ID=M.M_ID
ORDER BY B.B_NUM DESC;
REM INSERTING into VAPS.BOARD
SET DEFINE OFF;
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (136,'a','a계정 게시글 수정',to_date('13/09/03','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (137,'a','ㅁㅁㅁ',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (138,'a','수정 테스트2',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (139,'a','관리자 : 수정 테스트',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (135,'a','aaa',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (133,'a','게시글 수정 테스트',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (132,'admin','A',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (134,'a','asd',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (143,'q','qweqwe',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (162,'a','라면',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (144,'a','내용 저장 처리',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (146,'a','합친 후 테스트',to_date('13/09/04','RR/MM/DD'),4);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (163,'a','ê³ ê¸°',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (164,'a','음악',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (165,'a','게임',to_date('13/09/08','RR/MM/DD'),6);
Insert into VAPS.BOARD (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT) values (161,'a','한글',to_date('13/09/08','RR/MM/DD'),1);
REM INSERTING into VAPS.ITEMS
SET DEFINE OFF;
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (41,'기본 도시락','도시락',2000,'basic1.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (42,'등심돈까스 도시락','도시락',3400,'basic2.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (43,'정식 도시락','도시락',3800,'basic3.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (44,'야채참치비빔밥','비빔밥',2700,'bi1.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (45,'제육강된장비빔밥','비빔밥',3500,'bi2.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (46,'열무강된장비빔밥','비빔밥',3500,'bi3.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (47,'치킨마요','마요',2700,'ma1.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (48,'참치마요','마요',2700,'ma2.jpg');
Insert into VAPS.ITEMS (I_NUM,I_NAME,I_CATEGORY,I_PRICE,I_PIC) values (49,'떡산적마요','마요',2700,'ma3.jpg');
REM INSERTING into VAPS.ITEMSTORED
SET DEFINE OFF;
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('기본 도시락',100);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('등심돈까스 도시락',100);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('정식 도시락',50);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('야채참치비빔밥',300);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('제육강된장비빔밥',500);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('열무강된장비빔밥',220);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('치킨마요',600);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('참치마요',500);
Insert into VAPS.ITEMSTORED (IS_NAME,IS_COUNT) values ('떡산적마요',150);
REM INSERTING into VAPS.MEMBERS
SET DEFINE OFF;
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('q','q','xflW2blGMwM=','123123123','qqqq',0,0);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('as','한글','bWI8m5ooHHE=','123123123123','ㅋㅋㅋㅋ',0,0);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('admin','관리자','jAkdR9RQh/8=','01023235656','서울시 강남구',0,1);
Insert into VAPS.MEMBERS (M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values ('a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
REM INSERTING into VAPS.BLIST
SET DEFINE OFF;
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (1,165,'a','테스트','게임',to_date('13/09/08','RR/MM/DD'),6);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (2,164,'a','테스트','음악',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (3,163,'a','테스트','ê³ ê¸°',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (4,162,'a','테스트','라면',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (5,161,'a','테스트','한글',to_date('13/09/08','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (6,146,'a','테스트','합친 후 테스트',to_date('13/09/04','RR/MM/DD'),4);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (7,144,'a','테스트','내용 저장 처리',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (8,143,'q','q','qweqwe',to_date('13/09/04','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (9,139,'a','테스트','관리자 : 수정 테스트',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (10,138,'a','테스트','수정 테스트2',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (11,137,'a','테스트','ㅁㅁㅁ',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (12,136,'a','테스트','a계정 게시글 수정',to_date('13/09/03','RR/MM/DD'),1);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (13,135,'a','테스트','aaa',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (14,134,'a','테스트','asd',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (15,133,'a','테스트','게시글 수정 테스트',to_date('13/09/03','RR/MM/DD'),0);
Insert into VAPS.BLIST (B_NO,B_NUM,B_ID,M_NICK,B_SUB,B_DATE,B_READCOUNT) values (16,132,'admin','관리자','A',to_date('13/09/03','RR/MM/DD'),0);
REM INSERTING into VAPS.BLISTDESC
SET DEFINE OFF;
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (165,'a','게임',to_date('13/09/08','RR/MM/DD'),6,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (164,'a','음악',to_date('13/09/08','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (163,'a','ê³ ê¸°',to_date('13/09/08','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (162,'a','라면',to_date('13/09/08','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (161,'a','한글',to_date('13/09/08','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (146,'a','합친 후 테스트',to_date('13/09/04','RR/MM/DD'),4,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (144,'a','내용 저장 처리',to_date('13/09/04','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (143,'q','qweqwe',to_date('13/09/04','RR/MM/DD'),1,'q','q','xflW2blGMwM=','123123123','qqqq',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (139,'a','관리자 : 수정 테스트',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (138,'a','수정 테스트2',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (137,'a','ㅁㅁㅁ',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (136,'a','a계정 게시글 수정',to_date('13/09/03','RR/MM/DD'),1,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (135,'a','aaa',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (134,'a','asd',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (133,'a','게시글 수정 테스트',to_date('13/09/03','RR/MM/DD'),0,'a','테스트','jAkdR9RQh/8=','01022223333','서울시',0,0);
Insert into VAPS.BLISTDESC (B_NUM,B_ID,B_SUB,B_DATE,B_READCOUNT,M_ID,M_NICK,M_PWD,M_PHONE,M_ADDR,M_POINT,M_AUTH) values (132,'admin','A',to_date('13/09/03','RR/MM/DD'),0,'admin','관리자','jAkdR9RQh/8=','01023235656','서울시 강남구',0,1);
--------------------------------------------------------
--  DDL for Index ITEMS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "VAPS"."ITEMS_UK1" ON "VAPS"."ITEMS" ("I_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007085
--------------------------------------------------------

  CREATE UNIQUE INDEX "VAPS"."SYS_C007085" ON "VAPS"."ITEMS" ("I_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007337
--------------------------------------------------------

  CREATE UNIQUE INDEX "VAPS"."SYS_C007337" ON "VAPS"."BOARD" ("B_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007339
--------------------------------------------------------

  CREATE UNIQUE INDEX "VAPS"."SYS_C007339" ON "VAPS"."MEMBERS" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "VAPS"."BOARD" ADD PRIMARY KEY ("B_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_SUB" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_ID" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."BOARD" MODIFY ("B_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "VAPS"."ITEMS" MODIFY ("I_NUM" NOT NULL ENABLE);
  ALTER TABLE "VAPS"."ITEMS" ADD CONSTRAINT "SYS_C007085" PRIMARY KEY ("I_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "VAPS"."ITEMS" ADD CONSTRAINT "ITEMS_UK1" UNIQUE ("I_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE "VAPS"."MEMBERS" ADD PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "VAPS"."MEMBERS" MODIFY ("M_PWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "VAPS"."BOARD" ADD CONSTRAINT "B_WRITER_FK" FOREIGN KEY ("B_ID")
	  REFERENCES "VAPS"."MEMBERS" ("M_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEMSTORED
--------------------------------------------------------

  ALTER TABLE "VAPS"."ITEMSTORED" ADD CONSTRAINT "ITEMSTORED_ITEMS_FK1" FOREIGN KEY ("IS_NAME")
	  REFERENCES "VAPS"."ITEMS" ("I_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRGITEMS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VAPS"."TRGITEMS" 
 AFTER UPDATE ON ITEMS FOR EACH ROW
BEGIN
  UPDATE ITEMSTORED
  SET IS_NAME = :new.I_NAME
  WHERE IS_NAME = :old.I_NAME;
END; 
/
ALTER TRIGGER "VAPS"."TRGITEMS" ENABLE;
--------------------------------------------------------
--  DDL for Synonymn B
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "VAPS"."B" FOR "VAPS"."BOARD";
--------------------------------------------------------
--  DDL for Synonymn M
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "VAPS"."M" FOR "VAPS"."MEMBERS";

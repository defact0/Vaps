--------------------------------------------------------------------
-- 프로젝트용 오라클 계정 생성
-- vaps 계정 생성 , sys나 system계정에서 수행
CREATE USER vaps IDENTIFIED BY 1111
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
-- 권한 부여 ( 뷰 생성, 시노민 etc)
GRANT connect, resource, create synonym, create view to vaps; 
grant create trigger to vaps;

------------------------------------------------------------------
-- vaps 계정에 접속해서 DB구축
-- MEMBERS(회원) 테이블 정의
CREATE TABLE MEMBERS(
  M_ID NVARCHAR2(20),
  M_NICK NVARCHAR2(20),
  M_PWD NVARCHAR2(20) NOT NULL, --암호화(DB암호화)
  M_PHONE NVARCHAR2(20),
  M_ADDR NVARCHAR2(100),
  M_POINT NUMBER(20) DEFAULT '0',
  M_AUTH NUMBER DEFAULT '0', -- 일반 사용자 0 관리자 1로 권한 구분
  PRIMARY KEY(M_ID) -- PK지정
);
 -- MEMBERS를 M으로 줄여서(별명)
 CREATE OR REPLACE SYNONYM M FOR MEMBERS;

-------------------------------------------------------------------
-- 게시판 (현재는 답글 기능 없는거)

CREATE TABLE BOARD(
  B_NUM NUMBER NOT NULL,
  B_ID	NVARCHAR2(20) NOT NULL,
  B_SUB NVARCHAR2(50) NOT NULL,
  B_CONTENTS NCLOB NOT NULL,
  B_DATE DATE DEFAULT SYSDATE,
  B_READCOUNT NUMBER DEFAULT 0,
  PRIMARY KEY(B_NUM)
);

CREATE SEQUENCE BOARD_SEQ;
CREATE SYNONYM B FOR BOARD;

 -- 회원탈퇴시 쓴 게시글 다 지우기(제약조건)
ALTER TABLE BOARD
ADD CONSTRAINTS B_WRITER_FK FOREIGN KEY(B_ID)
REFERENCES MEMBERS(M_ID) ON DELETE CASCADE;

-- 게시판리플레이
CREATE TABLE BOARD_REPLY(
    R_NUM 		NUMBER 			NOT NULL,
    R_BNUM 		NUMBER 			NOT NULL,
    R_CONTENTS 	NVARCHAR2(200) 	NOT NULL,
    R_ID	 	NVARCHAR2(20) 	NOT NULL,
    R_DATE 		DATE 			DEFAULT SYSDATE
);

CREATE SEQUENCE REPLY_SEQ;
CREATE SYNONYM R FOR BOARD_REPLY;

ALTER TABLE BOARD_REPLY
ADD CONSTRAINTS R_NUM_PK PRIMARY KEY(R_NUM);
ALTER TABLE BOARD_REPLY
ADD CONSTRAINTS R_BNUM_FK FOREIGN KEY(R_BNUM)
REFERENCES BOARD(B_NUM);
ALTER TABLE BOARD_REPLY
ADD CONSTRAINTS R_WRITER_FK FOREIGN KEY(R_ID)
REFERENCES MEMBERS(M_ID);

--리플레이 뷰 설정
CREATE OR REPLACE VIEW RLIST AS
SELECT B.B_NUM AS "BNUM",
    R.R_NUM AS "RNUM",
    R.R_CONTENTS AS "RCONTENTS",
    R.R_DATE AS "RDATE",
    R.R_ID AS "RID"
FROM R INNER JOIN B
ON R.R_BNUM=B.B_NUM;

---------------------------------------------------------------------------------------------------
-- 게시글 뷰 만들기
-- [게시글 출력 문제] rownum을 직접 참조를 못해 뷰를 생성해야할수 밖에 없다
-- 최근에 쓴 게시글이 맨위로 보여지기 위해서 정렬을 해야한다.

-- MEMBERS와 BOARD 테이블을 INNERJOIN과 동시에 B_NUM을 내림차순 정렬
CREATE OR REPLACE VIEW BLISTDESC AS
SELECT *
FROM B INNER JOIN M ON B.B_ID=M.M_ID
ORDER BY B.B_NUM DESC;

-- INNERJOIN해서 나온 결과물인 BLISTDESC 뷰에서 게시판에 출력될 컬럼만 뽑아낸다.
-- B_NO은 실제 저장된 게시글을 1번부터 숫자를 붙여 게시판 페이징 기능에 사용할 예정이다.
CREATE OR REPLACE VIEW BLIST AS
SELECT ROWNUM AS B_NO, 
            B_NUM,
            B_ID,
            M_NICK,
            B_SUB,
            B_CONTENTS,
            B_DATE,
            B_READCOUNT
FROM BLISTDESC; 

------------------------------------------------------------------
-- 관리자 계정은 sql로 직접생성해야 한다.
-- 관리자급 계정 생성, 패스워드 a
INSERT INTO MEMBERS VALUES('admin','관리자','jAkdR9RQh/8=','01023235656','서울시 강남구',DEFAULT, 1);

-- 관리자급 계정 지우기(게시글 삭제 테스트 자기가 쓴 글이 아닐 때)
DELETE FROM MEMBERS WHERE M_ID='admin';

-- 글쓰기 수정 연습
UPDATE BOARD SET B_SUB='A', B_CONTENTS='A' WHERE B_NUM=132;

-- 조회수 증가
-- UPDATE BOARD SET B_READCOUNT=B_READCOUNT+1 WHERE B_NUM=#{b_num}
UPDATE BOARD SET B_READCOUNT=B_READCOUNT+1 WHERE B_NUM=146

-----------------------------------------------
-- 공지사항 (관리자는 모든접근가능, 일반은 리스트와 글 내용보기만)
-- 공지사항 테이블
CREATE TABLE NOTICE(
  N_NUM NUMBER NOT NULL,
  N_ID	NVARCHAR2(20) NOT NULL,
  N_SUB NVARCHAR2(50) NOT NULL,
  N_CONTENTS NCLOB NOT NULL,
  N_DATE DATE DEFAULT SYSDATE,
  N_READCOUNT NUMBER DEFAULT 0,
  PRIMARY KEY(N_NUM)
);
-- 시퀀스와 별칭
CREATE SEQUENCE NOTICE_SEQ;
CREATE SYNONYM N FOR NOTICE;
-- 뷰 생성
CREATE OR REPLACE VIEW NLIST AS
SELECT ROWNUM AS N_NO, 
            N_NUM,
            N_ID,
            M_NICK,
            N_SUB,
            N_CONTENTS,
            N_DATE,
            N_READCOUNT
FROM (SELECT *
      FROM N INNER JOIN M ON N.N_ID = M.M_ID
      ORDER BY N.N_NUM 
      DESC
      ); 




--------------------------------------------
-- 판매물품 작업


-- 판매물품 테이블
CREATE TABLE ITEMS(
  I_NUM NUMBER,
  I_NAME NVARCHAR2(100),
  I_CATEGORY NVARCHAR2(100),
  I_PRICE NUMBER DEFAULT 0,
  I_PIC NVARCHAR2(100),
  I_DESCRIPTION NCLOB,
  PRIMARY KEY(I_NAME)
);
CREATE sequence item_seq;

-- 판매물품 재료 테이블
CREATE TABLE ITEMSTORED(
  IS_NAME NVARCHAR2(100),
  IS_COUNT NUMBER DEFAULT 0,
  PRIMARY KEY(IS_NAME)
);

-- 판매물품과 판매물품 재료 테이블 제약조건
ALTER TABLE ITEMSTORED
ADD CONSTRAINTS ITEM_STORED_NAME_FK FOREIGN KEY(IS_NAME)
REFERENCES ITEMS(I_NAME) ON DELETE CASCADE;


-- 판매물품 자료
INSERT INTO ITEMS VALUES('도련님도시락','도시락', 3200);
 
-- 판매물품 재료 자료
INSERT INTO ITEMSORED VALUES('도련님도시락',1000);


----------------
-- 트리거 (판매물품 이름 수정)
CREATE OR REPLACE TRIGGER trgITEMS
 AFTER UPDATE ON ITEMS FOR EACH ROW
BEGIN
  UPDATE ITEMSTORED
  SET IS_NAME = :new.I_NAME
  WHERE IS_NAME = :old.I_NAME;
END; 

-- SALES 테이블 생성
-- SALES기록 시퀀스
CREATE SEQUENCE SALES_SEQ;
-- SALES 테이블 작성
CREATE TABLE SALES(
  S_NUM NUMBER NOT NULL,
  S_ID NVARCHAR2(20) NOT NULL,
  S_ITEM_NAME NVARCHAR2(100) NOT NULL,
  S_BUY_CODE  NUMBER,
  S_BUY_PRICE NUMBER DEFAULT 0,
  S_BUY_CNT NUMBER DEFAULT 0,
  S_BUY_DATE DATE DEFAULT SYSDATE,
  PRIMARY KEY(S_NUM)
);
--관계설정
-- MEMBERS(M_ID) --> SALES(S_ID)
ALTER TABLE SALES
ADD CONSTRAINTS SALES_ID_FK FOREIGN KEY(S_ID)
REFERENCES MEMBERS(M_ID) ON DELETE CASCADE;
-- ITEMS(I_NAME) --> SALES(S_ITEM_NAME)
ALTER TABLE SALES
ADD CONSTRAINTS SALES_NAME_FK FOREIGN KEY(S_ITEM_NAME)
REFERENCES ITEMS(I_NAME) ON DELETE CASCADE;

-- 트리거 (판매물품 이름 수정)
CREATE OR REPLACE TRIGGER CHANGE_ITEMS_CNT
AFTER INSERT ON SALES FOR EACH ROW
BEGIN
  UPDATE ITEMSTORED SET IS_COUNT = IS_COUNT - :NEW.S_BUY_CNT WHERE IS_NAME = :NEW.S_ITEM_NAME;
END;

-- 트리거 활성화
ALTER TRIGGER TRGITEMS ENABLE;
ALTER TRIGGER trgSALES_CNT ENABLE;

--SALES_GET_CODE 판매코드 얻기용 뷰
CREATE OR REPLACE VIEW SALES_GET_CODE AS
SELECT NVL(MAX(S_BUY_CODE),0) AS S_BUY_CODE
FROM SALES;




-- buyhistory.jsp 판매내역
SELECT DISTINCT S.S_BUY_CODE AS S_BUY_CODE, S.S_BUY_DATE AS S_BUY_DATE, SS.S_BUY_CNT AS S_BUY_CNT, SS.S_BUY_PRICE AS S_BUY_PRICE
FROM SALES S, (SELECT S_BUY_CODE, SUM(S_BUY_CNT) AS S_BUY_CNT,SUM(S_BUY_PRICE) AS S_BUY_PRICE FROM SALES GROUP BY S_BUY_CODE) SS
WHERE S.S_BUY_CODE = SS.S_BUY_CODE
order by S_BUY_CODE DESC;

-- id= a의 구입 내역 보기
SELECT DISTINCT S.S_BUY_CODE AS S_BUY_CODE, S.S_BUY_DATE AS S_BUY_DATE, SS.S_BUY_CNT AS S_BUY_CNT, SS.S_BUY_PRICE AS S_BUY_PRICE
FROM SALES S, (SELECT S_BUY_CODE, SUM(S_BUY_CNT) AS S_BUY_CNT,SUM(S_BUY_PRICE) AS S_BUY_PRICE FROM SALES GROUP BY S_BUY_CODE) SS
WHERE S.S_BUY_CODE = SS.S_BUY_CODE AND S.S_ID='a'
order by S_BUY_CODE DESC;

-- 세부내역보기
SELECT * FROM SALES WHERE S_BUY_CODE=1

-- 랜덤출력(1개만)
SELECT * FROM ( SELECT * FROM ITEMS ORDER BY dbms_random.value ) WHERE rownum = 1

-- 최근에 구입한 상품(리스트로 받아야함)
SELECT * FROM SALES WHERE S_BUY_CODE=(SELECT MAX(S_BUY_CODE) FROM SALES WHERE S_ID='a');

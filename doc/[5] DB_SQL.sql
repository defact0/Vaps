--------------------------------------------------------------------
-- 프로젝트용 오라클 계정 생성
-- vaps 계정 생성 , sys나 system계정에서 수행
CREATE USER vaps IDENTIFIED BY 1111
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
-- 권한 부여 ( 뷰 생성, 시노민 etc)
GRANT connect, resource, create synonym, create view to vaps; 

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
CREATE SEQUENCE BOARD_SEQ;

CREATE TABLE BOARD(
  B_NUM NUMBER NOT NULL,
  B_ID	NVARCHAR2(20) NOT NULL,
  B_SUB NVARCHAR2(50) NOT NULL,
  B_CONTENTS NCLOB NOT NULL,
  B_DATE DATE DEFAULT SYSDATE,
  B_READCOUNT NUMBER DEFAULT 0,
  PRIMARY KEY(B_NUM)
);

CREATE SYNONYM B FOR BOARD;

 -- 회원탈퇴시 쓴 게시글 다 지우기(제약조건)
ALTER TABLE BOARD
ADD CONSTRAINTS B_WRITER_FK FOREIGN KEY(B_ID)
REFERENCES MEMBERS(M_ID) ON DELETE CASCADE;

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






--------------------------------------------
-- 판매물품 작업


-- 판매물품 테이블
CREATE TABLE ITEMS(
  I_NAME NVARCHAR2(100),
  I_CATEGORY NVARCHAR2(100),
  I_PRICE NUMBER DEFAULT 0,
  PRIMARY KEY(I_NAME)
);
-- 참고 http://302.pe.kr/116
ALTER TABLE ITEMS ADD I_PIC BLOB;
ALTER TABLE ITEMS ADD I_DESCRIPTION NCLOB;

-- 판매물품 재료 테이블
CREATE TABLE ITEMSORED(
  IS_NAME NVARCHAR2(100),
  IS_COUNT NUMBER DEFAULT 0,
  PRIMARY KEY(IS_NAME)
);

-- 판매물품과 판매물품 재료 테이블 제약조건
ALTER TABLE ITEMSORED
ADD CONSTRAINTS ITEM_STORED_NAME_FK FOREIGN KEY(IS_NAME)
REFERENCES ITEMS(I_NAME) ON DELETE CASCADE;


-- 판매물품 자료
INSERT INTO ITEMS VALUES('도련님도시락','도시락', 3200);
INSERT INTO ITEMS VALUES('돈가스도시락','도시락', 3600);
INSERT INTO ITEMS VALUES('치킨도시락','도시락', 3000);
INSERT INTO ITEMS VALUES('육계장','라면', 1000);
INSERT INTO ITEMS VALUES('무파마','라면', 1200);
INSERT INTO ITEMS VALUES('신라면 블랙','라면', 1500);
INSERT INTO ITEMS VALUES('야채비빔밥','비빔밥', 1000);
INSERT INTO ITEMS VALUES('치킨마요','비빔밥', 1200);
INSERT INTO ITEMS VALUES('돈까스마요','비빔밥', 1500);
-- 판매물품 재료 자료
INSERT INTO ITEMSORED VALUES('도련님도시락',1000);
INSERT INTO ITEMSORED VALUES('돈가스도시락',1000);
INSERT INTO ITEMSORED VALUES('치킨도시락',1000);
INSERT INTO ITEMSORED VALUES('육계장',1000);
INSERT INTO ITEMSORED VALUES('무파마',1000);
INSERT INTO ITEMSORED VALUES('신라면 블랙',1000);
INSERT INTO ITEMSORED VALUES('야채비빔밥',1000);
INSERT INTO ITEMSORED VALUES('치킨마요',1000);
INSERT INTO ITEMSORED VALUES('돈까스마요',1000);

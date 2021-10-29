

------------------------------------공지사항 게사판-----------------------------------------
CREATE TABLE NOTICE(
	NOTI_NO NUMBER PRIMARY KEY,
	NOTI_GNO NUMBER NOT NULL,
	NOTI_GSQ NUMBER NOT NULL,
	NOTI_TAB NUMBER NOT NULL,
	NOTI_TITLE VARCHAR2(2000)NOT NULL,
	NOTI_WRITER VARCHAR2(30) DEFAULT '관리자' NOT NULL,
	NOTI_CONTENT VARCHAR2(4000) NOT NULL,
	NOTI_REGDATE DATE DEFAULT SYSDATE NOT NULL
);
--게시글 번호용 시퀸스-----
CREATE SEQUENCE NOTI_NO_SQ NOCACHE;
---그룹 내 순서용 시퀸스
CREATE SEQUENCE NOTI_GNO_SQ NOCACHE;
--
INSERT INTO NOTICE VALUES(
	NOTI_NO_SQ.NEXTVAL, NOTI_GNO_SQ.NEXTVAL, 1, 0, 
	'테스트 데이터 입니다', DEFAULT, '테스트데이터', DEFAULT
);

--값 테스트--
INSERT INTO NOTICE VALUES(
	NOTI_NO_SQ.NEXTVAL, NOTI_GNO_SQ.NEXTVAL, 1, 0, 
	'테스트 데이터 222입니다', DEFAULT, '테스트데이터222', DEFAULT
);

SELECT * FROM NOTICE;

-----------------------------------------소소유저 정보-------------------------------------------------------
DROP TABLE SOSO_USER;

CREATE TABLE SOSO_USER(
      USER_NO NUMBER PRIMARY KEY,
      USER_PR VARCHAR2(30) NOT NULL,
      USER_NAME VARCHAR2(30)NOT NULL,
      USER_ID VARCHAR(20) UNIQUE NOT NULL,
      USER_PW VARCHAR(100) NOT NULL,
      USER_NN VARCHAR(50) UNIQUE NOT NULL,
      GRADE NUMBER NOT NULL,
      ADDR VARCHAR2(4000) NOT NULL,
      PHONE NUMBER NOT NULL,
      EMAIL VARCHAR2(1000) NOT NULL,
      USER_POINT NUMBER DEFAULT 100 NOT NULL ,
      USER_STAR NUMBER DEFAULT 100 NOT NULL,
      SUB_YN CHAR(1) DEFAULT 'N' NOT NULL ,
      ENABLED_YN CHAR(1) DEFAULT 'N' NOT NULL,
      USER_TYPE VARCHAR2(5) DEFAULT 'USER' NOT NULL,
      REGION VARCHAR2(100) NOT NULL,
      CONSTRAINT soso_user_region CHECK (REGION IN('SEOUL','GYEONGGI','INCHEON')),
      CONSTRAINT soso_user_grade CHECK (GRADE IN(1,2,3)),
      CONSTRAINT soso_user_sub CHECK (    SUB_YN IN ('Y','N')),
      CONSTRAINT soso_user_enabled CHECK (ENABLED_YN IN ('Y','N')),
      CONSTRAINT soso_user_user_type CHECK (USER_TYPE IN ('USER','ADMIN'))
);

--회원번호용 시퀸스---
CREATE SEQUENCE USER_NO_SQ NOCACHE;

--값 테스트--
INSERT INTO SOSO_USER VALUES(
	USER_NO_SQ.NEXTVAL,'김미영','최재윤','my1007','test1234','테스트용닉네임',2,
	'서울시 강남구 개포동 어쩌구저쩌구 123-1101',01098765432,'test123@gmail.com',
	DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,'SEOUL'
);

SELECT *
FROM (
SELECT ROWNUM R, A.USER_NO, A.USER_ID, A.USER_POINT
FROM(SELECT USER_NO, USER_ID, USER_POINT
FROM SOSO_USER
ORDER BY USER_POINT DESC) A) B
WHERE USER_NO = 7;

select * from soso_user;
----------------------------고객문의 게시판----------------------------------
CREATE TABLE QNA (
	QNA_NO NUMBER PRIMARY KEY,
	QNA_GNO NUMBER NOT NULL,
	QNA_GSQ NUMBER NOT NULL,
	QNA_TAB NUMBER NOT NULL,
	QNA_TITLE VARCHAR2(2000)NOT NULL,
	QNA_WRITER VARCHAR2(30) NOT NULL,
	QNA_CONTENT VARCHAR2(4000) NOT NULL,
	QNA_REGDATE DATE DEFAULT SYSDATE NOT NULL
);
--게시글 번호용 시퀸스-----
CREATE SEQUENCE QNA_NO_SQ NOCACHE;
---그룹 내 순서용 시퀸스
CREATE SEQUENCE QNA_GNO_SQ NOCACHE;
--
INSERT INTO QNA VALUES(
	NOTI_NO_SQ.NEXTVAL, NOTI_GNO_SQ.NEXTVAL, 1, 0, 
	'문의하기 테스트데이터 입니다',  'user1', '테스트데이터', DEFAULT
);
SELECT * FROM QNA
ORDER BY QNA_GNO DESC, QNA_GSQ;
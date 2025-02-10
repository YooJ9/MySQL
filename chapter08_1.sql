-- 테이블 만들기
-- < 실습 1> --
DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqldb;
DROP DATABASE IF EXISTS tabledb;

CREATE DATABASE tabledb;

-- < 실습 2> --
DROP DATABASE tabledb;
CREATE DATABASE tabledb;

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl
(	userID		CHAR(8) NOT NULL PRIMARY KEY,
	name		VARCHAR(10) NOT NULL,
    birthYear	INT NOT NULL,
    addr		CHAR(2) NOT NULL,
    mobile1		CHAR(3) NULL,
    mobile2		CHAR(8) NULL,
    height		SMALLINT NULL,
    mDate		DATE NULL
);

ALTER TABLE usertbl
	ADD CONSTRAINT PK_usertbl_userID PRIMARY KEY (userID);	-- 제약 조건은 따로 설정 가능

CREATE TABLE buytbl
(	num    		INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid  	CHAR(8) NOT NULL,
    prodName	CHAR(6) NOT NULL,
    groupName	CHAR(4) NOT NULL,
    price		INT NOT NULL,
    amount		SMALLINT NOT NULL,
	FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
INSERT INTO usertbl VALUES('KBS','김범수',1979,'경남','011','2222222',173,'2012-4-4');
INSERT INTO usertbl VALUES('KKH','김경호',1971,'전남','019','333333',177,'2007-7-7');

INSERT INTO buytbl VALUES(NULL,'KBS','운동화',NULL,30,2);
INSERT INTO buytbl VALUES(NULL,'KBS','노틉북','전자',1000,1);
INSERT INTO buytbl VALUES(NULL,'JYP','모니터','전자',200,1);	-- JYP 존재 x

-- 제약 조건 (PK, FK, UNIQUE..)
DESCRIBE usertbl;	-- 테이블 정보를 볼 수 있음.

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
(	prodCode	CHAR(3) NOT NULL,
	prodID		CHAR(4) NOT NULL,
    prodDate	DATETIME NOT NULL,
    prodCur		CHAR(10) NULL,
    CONSTRAINT PK_prodTbl_proCode_prodID PRIMARY KEY (prodCode, prodID)		-- PK
);

SHOW INDEX FROM prodTbl;

-- CONSTRAINT FK_userTBL_buyTBL FOREIGN KEY(userID) REFERENCES userTBL(userID);
-- FOREIGN KEY(userID) REFERENCES userTBL(userID);
-- FK (기준 테이블이 PK,Unique가 아니면 안됨)

SHOW INDEX FROM buytbl;

-- PRIMARY KEY vs UNIQUE
--   NOT NULL	   NULL

-- CHECK : 입력되는 데이터 점검하는 기능
-- ex) birthYear	INT CHECK (birthYear >= 1900 AND birthYear <= 2023)
--     CONSTRAINT CK_name CHECK (name IS NOT NULL)

-- DEFAULT : 자동으로 입력되는 기본 값 정의
-- ex) DEFAULT -1, '서울', 170 ...
-- ex) ALTER COLUMN birthYear SET DEFAULT '서울';

-- 테이블 압축
-- < 실습 3> --
CREATE DATABASE IF NOT EXISTS compressDB;
USE	compressDB;
CREATE TABLE normalTBL( emp_no int, first_name varchar(14));
CREATE TABLE compressTBL( emp_no int, first_name varchar(14))
	ROW_FORMAT=COMPRESSED;	-- 테이블 압축

INSERT INTO normalTbl
	SELECT emp_no, first_name FROM employees.employees;	-- 2.4sec 40 length

INSERT INTO compressTBL
	SELECT emp_no, first_name FROM employees.employees;	-- 5.3sec 25 length (압축)
    
SHOW TABLE STATUS FRoM compressDB;

DROP DATABASE IF EXISTS compressDB;


































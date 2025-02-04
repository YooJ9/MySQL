-- chapter06 SELECT문
USE employees;

-- 데이터 베이스 이름 확인
USE mysql;
SELECT * FROM employees; -- X

SELECT * FROM titles;	-- titles 테이블에서 모든 열의 내용 요청
SELECT * FROM employees.titles;	-- 원칙(데이터베이스 이름)이나 생략 가능

SELECT first_name FROM employees;	-- 필요로 하는 열만 가져오기
SELECT first_name, last_name, gender FROM employees;	-- 여러 열

-- <한 줄 주석>
/* 
<여러 줄 주석>
*/

-- <실습 1> --
SHOW DATABASES;	-- 데이터베이스 목록 조회
USE employees;
SHOW TABLE STATUS;	-- 데이터베이스 안 테이블 내용
DESCRIBE employees;	-- 테이블 내 정보 확인
SELECT first_name, gender FROM employees;	-- 열 이름 확인 후 최종적으로 데이터 조회
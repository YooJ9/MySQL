-- <실습 3> --

USE sqldb;
CREATE TABLE bigTbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl3 (SELECT * FROM employees.employees);

DELETE FROM bigTbl1;		-- 테이블 내용 삭제 (제일 오래 걸림)
DROP TABLE bigTbl2;			-- 테이블 삭제
TRUNCATE TABLE bigTbl3;		-- 테이블 구조 o, delete와 동일

-- <실습 4> --

USE sqldb;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3);
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);	-- pk 지정
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES('BBK', '비비코', '미국');	-- 2,3번째만 실행됨 (오류나면 무시하고 밑에 실행)
INSERT IGNORE INTO memberTBL VALUES('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY', '현주엽', '경기');

INSERT INTO memberTBL VALUES('BBK', '비비코', '미국')
	ON DUPLICATE KEY UPDATE name = '비비코', addr = '미국';		-- 기본키 중복시 UPDATE 수행
INSERT INTO memberTBL VALUES('DJM', '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name = '동짜몽', addr = '일본';		-- 중복 아닐 시 INSERT 수행

-- WITH절과 비재귀적 CTE
WITH abc(userid, total)					-- WITH구문으로 만든 SELECT 결과
AS
(SELECT userid, SUM(price * amount)
   FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;	-- 테이블로 간주하고 사용함

WITH cte_userTBL(addr, maxHeight)
AS
(SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxHeight * 1.0) AS '각 지역별 최고키의 평균' FROM cte_usertbl;


-- GROUP BY절
USE sqldb;
SELECT userID, amount	-- sqlDB의 구매 테이블에서 사용자가 구매한 물품의 개수 조회
	FROM buytbl
    ORDER BY userID;
    
-- 집계함수 SUM(), AVG(), MIN(), MAX(), COUNT()
SELECT userID AS '사용자 아이디' , SUM(amount) AS '총 구매 개수'	-- 별칭 사용
	FROM buytbl
    GROUP BY userID;	-- 사용자별로 묶어 구매 개수 합쳐서 조회
    
SELECT userID AS '사용자 아이디' , SUM(price * amount) AS '총 구매액'
	FROM buytbl
    GROUP BY userID;
    
SELECT AVG(amount) AS '평균 구매 개수'	-- 전체 회원 평균
	FROM buytbl;
    
SELECT userId, AVG(amount) AS '평균 구매 개수'	-- 회원별 구매 개수 평균
	FROM buytbl
    GROUP BY userID;
    
SELECT name, height
	FROM usertbl
    WHERE height = (SELECT MAX(height) FROM usertbl)
		OR height = (SELECT MIN(height) FROM usertbl);	-- 여러 개 조회시 서브쿼리 사용
        
SELECT COUNT(*) FROM usertbl;	-- 전체 회원
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

-- HAVING절
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
	FROM buytbl
    GROUP BY userID
    HAVING SUM(price * amount) > 1000	-- 집계 함수에 대한 조건 제한 (HAVING)
    ORDER BY SUM(price * amount);

-- WITH ROLLUP문
SELECT num, groupName, SUM(price * amount) AS '비용'
	FROM buytbl
    GROUP BY groupName, num
    WITH ROLLUP;	-- 중간 합계 및 총합 출력

/*

<DML>
- Data Manipulation Language : 데이터 조작 언어
- SELECT, INSERT, UPDATE, DELETE (선택, 삽입, 수정, 삭제)

<DDL>
- Data Definition Language : 데이터 정의 언어
- CREATE, DROP, ALTER (생성, 삭제, 변경)

<DCL>
- Data Control Language : 데이터 제어 언어
- GRANT, REVOKE, DENY (사용자에게 권한 부여, 박탈)

*/


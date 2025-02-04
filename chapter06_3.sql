-- WHERE절
USE sqldb;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;	-- 연속적인 값 사용
SELECT name, addr FROM usertbl WHERE addr IN ('경남', '전남', '경북');	-- 이산적인 값 사용

SELECT name, height FROM usertbl WHERE name LIKE '김%';	-- 성이 '김' 뒤 무엇이든 허용
SELECT name, height FROM usertbl WHERE name LIKE '_종신';	-- 앞 한 글자, 다음 종신인 사람 조회

-- 서브 쿼리
SELECT name, height FROM usertbl
	WHERE height >= (SELECT height FROM usertbl WHERE name = '김경호');

SELECT name, height FROM usertbl
	WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');
    -- 조회 값 2 이상 일 때, ANY 사용 : or
	-- ALL 사용 : and

-- ORDER BY절 (성능 떨어뜨림)
SELECT name, mDate FROM usertbl ORDER BY mDate; -- 순서대로 정렬(기본 : 오름차순)
SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

-- DISTINCT 중복된 값 하나만 출력
SELECT DISTINCT addr FROM usertbl;

-- LIMIT 구문
USE employees;
SELECT emp_no, hire_date FROM employees
	ORDER BY hire_date ASC
    LIMIT 0, 5;	-- 상위 5건만 출력 (시작, 개수)	-- 'LIMIT 개수 OFFSET 시작'

-- 테이블 복사
USE sqldb;
CREATE TABLE buytbl2 (SELECT * FROM buytbl);	-- 괄호 안 결과 값으로 테이블 만듦 (PK, FK 복사 안됨)
SELECT * FROM buytbl2;							-- buytbl2의 모든 행과 열 출력
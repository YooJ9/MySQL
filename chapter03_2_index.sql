CREATE TABLE indexTBL (		-- 인덱스 조회를 위한 테이블 생성
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    hire_date DATE
);
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
    FROM   employees.employees
    LIMIT  500;
    
SELECT * FROM indexTBL;	-- 총 500건 출력
SELECT * FROM indexTBL WHERE first_name = 'Mary';	-- Full Table Scan (인덱스 x)

CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);
SELECT * FROM indexTBL WHERE first_name = 'Mary';	-- Non-Unique Key LookUp (인덱스 o)

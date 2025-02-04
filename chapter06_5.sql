-- INSERT문
USE sqldb;
CREATE TABLE testTbl1 (id INT, userName CHAR(3), age INT);
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);	-- 테이블 순서에 맞춰 나열

-- AUTO_INCREMENT, ALTER(변경)문
CREATE TABLE testTbl2 (id INT AUTO_INCREMENT PRIMARY KEY, userName CHAR(3), age INT);

INSERT INTO testTbl2 VALUES (NUll, '지민', 25);	-- 자동 지정 시 pk 설정, null 지정
INSERT INTO testTbl2 VALUES (NUll, '유나', 22);
INSERT INTO testTbl2 VALUES (NUll, '유경', 21);

SELECT last_insert_id();						-- 마지막에 입력된 값 출력

ALTER TABLE testTbl2 AUTO_INCREMENT = 100;		-- 이후 입력값 100부터 시작
SET @@auto_increment_increment=3;				-- 3씩 증가
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
SELECT * FROM testTbl2;

INSERT INTO testTbl2 VALUES (NUll, '나연', 20), (NUll, '정연', 18), (NUll, '모모', 19);

-- 다량의 샘플 데이터 생성
USE sqldb;
CREATE TABLE testTbl3 (id INT, Fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testTbl3
	SELECT emp_no, first_name, last_name	-- SELECT문 열의 개수 = INSERT 테이블 열 개수
	FROM employees.employees;
    
-- 데이터 수정 : UPDATE
UPDATE testbl3
  SET Lname = '없음'
  WHERE Fname = 'Kyoichi';	-- WHERE절 생략 시 테이블 전체 행 변경됨
  
UPDATE buytbl SET price = price * 1.5;	-- 모두 변경하고 싶을 때 WHERE절 생략

-- 데이터 삭제 : DELETE
DELETE FROM testTbl3 WHERE Fname = 'Aamer';	-- Aamer 사용자만 삭제 (생략 시 테이블 삭제 !주의!)
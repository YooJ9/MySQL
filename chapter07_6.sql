-- IF ~ ELSE --
DROP PROCEDURE IF EXISTS ifProc;  -- 기존에 만든 적이 있다면 삭제
DELIMITER $$
CREATE PROCEDURE ifProc()
BEGIN
	DECLARE var1 INT;	-- var1 변수 선언
    SET var1 = 100;		-- 변수에 값 대입
    
    IF var1 = 100 THEN	-- 만약 @var1이 100이라면,
		SELECT '100입니다';
	ELSE
		SELECT '100이 아닙니다.';
	END IF;
END $$
DELIMITER ;
CALL ifProc();

DROP PROCEDURE IF EXISTS ifProc2;
USE employees;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE;	-- 입사일
	DECLARE curDATE DATE;	-- 오늘
	DECLARE days INT;	-- 근무한 일수

	SELECT hire_date INTO hireDATE -- hire_date열의 결과를 hireDATE에 대입
      FROM employees.employees
	 WHERE emp_no = 10001;
     
     SET curDATE = CURRENT_DATE();	-- 현재 날짜 
     SET days = DATEDIFF(curDATE, hireDATE);	-- 날짜의 차이, 일 단위
     
     IF(days/365) >= 5 THEN -- 5년이 지났다면
					SELECT CONCAT('입사한지', days, '일이나 지났습니다. 축하합니다!');
	ELSE
					SELECT '입사한지' + days + '일밖에 안되었네요. 열심히 일하세요.';
	END IF;
END $$
DELIMITER ;
CALL ifProc2();

-- CASE문 --
DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE point INT;
	DECLARE credit CHAR(1);
	SET point = 77;
    
	IF point >= 90 THEN
		SET credit = 'A';
	ELSEIF point >= 80 THEN
		SET credit = 'B';
	ELSEIF point >= 70 THEN
		SET credit = 'C';
    ELSEIF point >= 60 THEN
		SET credit = 'D';        
	ELSE
		SET credit = 'F';        
	END IF;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL ifProc3();

DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE point INT;
	DECLARE credit CHAR(1);
	SET point = 77;
    
    CASE
		WHEN point >= 90 THEN
			SET credit = 'A';
		WHEN point >= 80 THEN
			SET credit = 'B';
		WHEN point >= 70 THEN
			SET credit = 'C';
		WHEN point >= 60 THEN
			SET credit = 'D';        
		ELSE
			SET credit = 'F';        
	END CASE;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL ifProc3();

-- <실습 7> --
USE sqldb;
SELECT userID, SUM(price * amount) AS '총 구매액'
  FROM buytbl
 GROUP BY userID
 ORDER BY SUM(price * amount) DESC;
 
SELECT B.userID, U.name, SUM(price * amount) AS '총구매액'	-- join 이름 출력
  FROM buytbl B
 INNER JOIN usertbl U
    ON B.userID = U.userID
 GROUP BY B.userID, U.name
 ORDER BY SUM(price * amount) DESC;

SELECT B.userID, U.name, SUM(price * amount) AS '총구매액'	-- 아이디 조회 x
  FROM buytbl B
 RIGHT OUTER JOIN usertbl U
    ON B.userID = U.userID
 GROUP BY B.userID, U.name
 ORDER BY SUM(price * amount) DESC;

SELECT U.userID, U.name, SUM(price * amount) AS '총구매액'	-- usertbl로 변경
  FROM buytbl B
 RIGHT OUTER JOIN usertbl U
    ON B.userID = U.userID
 GROUP BY B.userID, U.name
 ORDER BY SUM(price * amount) DESC;

SELECT U.userID, U.name, SUM(price * amount) AS '총구매액',
	CASE
		WHEN (SUM(price * amount) >= 1500) THEN '최우수고객'
        WHEN (SUM(price * amount) >= 1000) THEN '우수고객'
        WHEN (SUM(price * amount) >= 1) THEN '일반고객'
        ELSE '유령고객'
	END AS '고객등급'
  FROM buytbl B
 RIGHT OUTER JOIN usertbl U
    ON B.userID = U.userID
 GROUP BY B.userID, U.name
 ORDER BY SUM(price * amount) DESC;  









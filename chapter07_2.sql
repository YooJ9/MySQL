-- 수학 함수
SELECT ABS(-100); -- 절대값 계산
SELECT CEILING(4.7), FLOOR(4.7), ROUND(4.7); -- 올림, 내림, 반올림 계산
SELECT CONV('AA', 16, 2), CONV(100, 10, 8); -- 숫자를 원래 진수에서 변환할 진수로 계산
SELECT DEGREES(PI()), RADIANS(180);	-- 라디안 값과 각도값 변환
SELECT MOD(157, 10), 157 % 19, 157 MOD 10; -- 숫자1을 숫자2로 나눈 나머지 값
SELECT POW(2, 3), SQRT(9); -- 거듭제곱값 및 제곱근
SELECT RAND(), FLOOR(1 + (RAND() * (7-1))); -- 0 이상 1 미만의 실수(*임의의 정수 범위 가능)
SELECT SIGN(100), SIGN(0), SIGN(-100.123); -- 숫자가 양수,0,음수인지 구함 (1, 0, -1 반환)
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);	-- 소수점 기준 정수까지만 나머진 버림

-- 날짜 및 시간 함수
SELECT ADDDATE('2025-01-01', INTERVAL 31 DAY), ADDDATE('2025-01-01', INTERVAL 1 MONTH); 
SELECT SUBDATE('2025-01-01', INTERVAL 31 DAY), SUBDATE('2025-01-01', INTERVAL 1 MONTH); 

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURDATE()), MINUTE(CURENT_TIME()), SECOND(CURDATE()), MICROSECOND(CURENT_TIME());
-- 현재 연, 월, 일, 시, 분, 초, 밀리초를 구한다.

SELECT DATE(NOW()), TIME(NOW()); -- 연-월-일 시:분:초 반환
SELECT DATEDIFF('2025-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10'); -- 날짜 계산, 시간 계산
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

SELECT PERIOD_ADD(202501, 11), PERIOD_DIFF(202501, 202312); -- 지난 개월 수, 사이 개월 수

SELECT QUARTER('2025-07-07'); -- 4분기 중 몇 분기

-- 시스템 정보 함수
SELECT CURRENT_USER(), DATABASE(); -- user, database 반환

USE sqldb;
SELECT * FROM usertbl;
SELECT FOUND_ROWS();   	-- 조회한 행 개수 반환

UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();		-- 입력, 수정, 삭제된 행의 개수를 구함

SELECT SLEEP(5);
SELECT '5초 후에 이게 보여요';	-- 시간만큼 쿼리 실행을 멈춤




















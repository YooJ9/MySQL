-- 날짜와 시간 데이터 형식
SELECT CAST('2020-10-19 12:35:29.123' AS DATE) AS 'DATE';  
SELECT CAST('2020-10-19 12:35:29.123' AS TIME) AS 'TIME';
SELECT CAST('2020-10-19 12:35:29.123' AS DATETIME) AS 'DATETIME';

-- 실습1 --
USE sqldb;

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==> ';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;

SELECT @myVar4, Name FROM usertbl WHERE height > 180;

SET @myVar1 = 3;
PREPARE myQuery
	FROM 'SELECT Name, height FROM usertbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1;

-- 데이터 형식 변환 함수(CAST(),CONCAT())
USE sqldb;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

SELECT CAST('2020&12&12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', 
		CAST(amount AS CHAR(4)), '=') AS '단가X수량', price * amount AS '구매액'
FROM buytbl;	-- CONCAT을 이용해 쿼리 결과를 보기 좋게 만듦

-- 암시적인 형 변환
SELECT '100' + '200';	-- 문자와 문자를 더함(정수로 변환되어 연산됨)
SELECT CONCAT('100','200');	-- 문자와 문자를 연결(문자로 처리)
SELECT 1 > '2mega';	-- 정수인 2로 변환되어서 비교 (false = 0)
SELECT 0 = 'mega2';	-- 문자는 0으로 변환됨 (true = 1)

-- MySQL 내장 함수
-- 1) IF
SELECT IF (100>200, '참이다', '거짓이다');
SELECT IFNULL(NULL, '널이군요'), IFNULL(100, '널이군요'); -- '널이군요', 100 출력
SELECT NULLIF(100, 100), NULLIF(200,100);	-- 200

-- 2) CASE
SELECT 
    CASE 10
        WHEN 1 THEN '일'
        WHEN 5 THEN '오'
        WHEN 10 THEN '십'
        ELSE '모름'
    END AS 'CASE연습';

-- 문자열 함수
SELECT ASCII('A'), CHAR(65);
SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc'); -- 할당된 Bit 크기, 문자 크기 반환
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT CONCAT_WS('/', '2025', '01', '01');	-- 문자열을 이어줌

SELECT FORMAT(123456.123456, 4); -- 소수점 4자리까지 출력
SELECT BIN(31), HEX(31), OCT(31); -- 2진수, 16진수, 8진수

SELECT INSERT('abcdefghi', 3, 4, '@@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);	-- 문자열 길이만큼 반환

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH'); -- 소문자, 대문자 변경

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##'); -- 문자열 길이 만큼 늘린 후에, 빈 곳에 문자열로 채움

SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ'); -- 앞뒤 공백 제거

SELECT REPLACE('이것이 MySQL이다', '이것이', 'This is');	-- 원래 문자열과 바꿀 문자열

SELECT SUBSTRING('대한민국만세', 3, 2); -- 시작위치부터 길이만큼 문자 반환

SELECT SUBSTRING_INDEX('cafe.naver.com','.',2), SUBSTRING_INDEX('cafe.naver.com','.',-2);
-- 구분자 기준 오른쪽, 왼쪽 버림

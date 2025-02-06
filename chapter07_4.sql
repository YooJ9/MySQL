-- JSON 데이터
-- JSON : JavaScript Object Notatioh 개방형 표준 데이터 포맷

USE sqldb;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
FROM usertbl
WHERE height >= 180;

SET @json='{ "usertbl" :
[
	{"name":"임재범","height": 182},
	{"name":"이승기","height": 182},
	{"name":"성시경","height": 186}
]
}';

SELECT JSON_VALID(@json) AS JSON_VALID;	-- 만족하면 1, 아니면 0 반환
SELECT JSON_SEARCH(@json, 'one', '성시경') AS JSON_SEARCH;
SELECT JSON_EXTRACT(@json, '$.usertbl[2].name') AS JSON_EXTRACT;
SELECT JSON_INSERT(@json, '$.usertbl[0].mDate', '2009-09-09') AS JSON_INSERT;
SELECT JSON_REPLACE(@json, '$.usertbl[0].name', '홍길동') AS JSON_REPLACE;
SELECT JSON_REMOVE(@json, '$.usertbl[0]') AS JSON_REMOVE;

-- 조인

USE sqldb;
SELECT *
	FROM buytbl
		INNER JOIN usertbl
			ON buytbl.userID = usertbl.userID
	WHERE buytbl.userID = 'JYP';
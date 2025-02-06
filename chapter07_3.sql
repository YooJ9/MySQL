-- <실습 2> --

CREATE DATABASE moviedb;

USE moviedb;
CREATE TABLE movietbl
 (movie_id			INT,
  movie_title		VARCHAR(30),
  movie_director 	VARCHAR(20),
  movie_star 		VARCHAR(20),
  movie_script		LONGTEXT,
  movie_film		LONGBLOB
  ) DEFAULT CHARSET=utf8mb4;
  
  INSERT INTO movietbl VALUES (1, '쉰들러 리스트', '스필버그', '리암 니슨',
	LOAD_FILE('C:/SQL/Movies/Schindler.txt'),
	LOAD_FILE('C:/SQL/Movies/Schindler.mp4'));
    
SELECT * FROM movietbl;

SHOW variables LIKE 'max_allowed_packet';	-- 파일 크기 확인
SHOW variables LIKE 'secure_file_priv';		-- 보안 확인

USE moviedb;
TRUNCATE movietbl; -- 기존 행 모두 제거

INSERT INTO movietbl VALUES (1, '쉰들러 리스트', '스필버그', '리암 니슨',  
	LOAD_FILE('C:/SQL/Movies/Schindler.txt'), LOAD_FILE('C:/SQL/Movies/Schindler.mp4'));
INSERT INTO movietbl VALUES (2, '쇼생크 탈출', '프랭크 다라본트', '팀 로빈스',  
	LOAD_FILE('C:/SQL/Movies/Shawshank.txt'), LOAD_FILE('C:/SQL/Movies/Shawshank.mp4'));    
INSERT INTO movietbl VALUES (3, '라스트 모히칸', '마이클 만', '다니엘 데이 루이스',
	LOAD_FILE('C:/SQL/Movies/Mohican.txt'), LOAD_FILE('C:/SQL/Movies/Mohican.mp4'));
    
SELECT movie_script FROM movietbl WHERE movie_id = 1
	INTO OUTFILE'C:/SQL/Movies/Schindler_out.txt'  -- OUTFILE: txt 파일
	LINES TERMINATED BY '\\n';

SELECT movie_film FROM movietbl  WHERE movie_id = 3 
	INTO DUMPFILE 'C:/SQL/Movies/Mohican_out.mp4';	-- DUMPFILE: 동영상 파일

-- <실습 3> -- 

USE sqldb;
CREATE TABLE pivotTest
(	uName	CHAR(3),
	season	CHAR(2),
    amount 	INT		);
    
INSERT INTO pivotTest VALUES
	('김범수', '겨울', 10),  ('윤종신' , '여름',  15) , ('김범수' , '가을',  25) , ('김범수' , '봄',    3) ,
	('김범수' , '봄',    37) , ('윤종신' , '겨울',  40) , ('김범수' , '여름',  14) ,('김범수' , '겨울',  22) ,
	('윤종신' , '여름',  64) ;
    
SELECT * FROM pivotTest;

SELECT uName,
	SUM(IF(season = '봄', amount, 0)) AS '봄',
	SUM(IF(season = '여름', amount, 0)) AS '여름',
	SUM(IF(season = '가을', amount, 0)) AS '가을',
	SUM(IF(season = '겨울', amount, 0)) AS '겨울',
	SUM(amount) AS '합계' FROM pivotTest GROUP BY uName;
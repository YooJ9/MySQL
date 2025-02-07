-- 외부 조인
USE sqldb;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
	LEFT OUTER JOIN buytbl B	-- 왼쪽 테이블은 모두 출력되어야 한다.(usertbl)
      ON U.userID = B.userID
  ORDER BY U.userID;
  
  SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
  FROM usertbl U
	LEFT OUTER JOIN buytbl B
      ON U.userID = B.userID
  WHERE B.prodName IS NULL	-- 기록이 없는 회원
  ORDER BY U.userID;
  
  -- <실습 5> --
  USE sqldb;
  SELECT S.stdName, S.addr, C.clubName, C.roomNo
    FROM stdtbl S
    LEFT OUTER JOIN stdclubtbl SC	-- OUTER JOIN시, 모든 학생을 출력할 수 있음
      ON S.stdName = SC.stdName
	LEFT OUTER JOIN clubtbl C
	  ON SC.clubName = C.clubName
   ORDER BY S.stdName;
   
   SELECT C.clubName, C.roomNo, S.stdName, S.addr
     FROM stdtbl S
     LEFT OUTER JOIN stdclubtbl SC
       ON S.stdName = SC.stdName
	RIGHT OUTER JOIN clubtbl C
	   ON SC.clubName = C.clubName
    ORDER BY C.clubName;
    
   SELECT S.stdName, S.addr, C.clubName, C.roomNo
    FROM stdtbl S
    LEFT OUTER JOIN stdclubtbl SC
      ON S.stdName = SC.stdName
	LEFT OUTER JOIN clubtbl C
	  ON SC.clubName = C.clubName
 UNION  -- 전부 출력
   SELECT S.stdName, S.addr, C.clubName, C.roomNo
     FROM stdtbl S
     LEFT OUTER JOIN stdclubtbl SC
       ON SC.stdName = S.stdName
	RIGHT OUTER JOIN clubtbl C
	   ON SC.clubName = C.clubName;
       
-- CROSS JOIN
USE employees;
SELECT COUNT(*) AS '데이터개수'
  FROM employees
  CROSS JOIN titles;	-- 큰 샘플 데이터를 생성할 때 사용

-- SELF JOIN
USE sqldb;
CREATE TABLE empTbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl VALUES('이부장','김재무','2222-2');
INSERT INTO empTbl VALUES('우대리','이부장','2222-2-1');
INSERT INTO empTbl VALUES('지사원','이부장','2222-2-2');
INSERT INTO empTbl VALUES('이영업','나사장','1111');
INSERT INTO empTbl VALUES('한과장','이영업','1111-1');
INSERT INTO empTbl VALUES('최정보','나사장','3333');
INSERT INTO empTbl VALUES('윤차장','최정보','3333-1');
INSERT INTO empTbl VALUES('이주임','윤차장','3333-1-1');

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
  FROM empTbl A
 INNER JOIN empTbl B
    ON A.manager = B.emp
 WHERE A.emp = '우대리';	-- 우대리 연락처 조회
 
 -- UNION
USE sqldb;
SELECT stdName, addr FROM stdtbl
UNION ALL	-- 중복된 열까지 모두 출력
SELECT clubName, roomNo FROM clubtbl;

-- NOT IN, IN
SELECT name, CONCAT(mobile1, mobile2) As '전화번호' FROM usertbl -- 두번째 쿼리 결과 제외
 WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);
 
SELECT name, CONCAT(mobile1, mobile2) As '전화번호' FROM usertbl -- 두번째 쿼리에 해당하는 결과만 출력
 WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);
   
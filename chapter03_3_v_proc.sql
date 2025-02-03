-- View
CREATE VIEW uv_memberTBL	-- View 생성
AS
	SELECT memberName, memberAddress FROM memberTBL;	-- SELECT문
    
SELECT * FROM uv_memberTBL;

-- Stored Procedure
SELECT * FROM memberTBL WHERE memberName = '당탕이';	-- 정보 동시 조회
SELECT * FROM productTBL WHERE productName = '냉장고';

DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '당탕이' ;
    SELECT * FROM productTBL WHERE productName = '냉장고' ;
END //
DELIMITER ;	-- 구분 문자

CALL myProc();	-- 프로시저 불러오기

-- Trigger
INSERT INTO memberTBL VALUES ('Figure', '연아', '경기도 군포시 당정동');

SELECT * FROM memberTBL;

UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';	-- 데이터 변경

DELETE FROM memberTBL WHERE memberName = '연아';	-- 데이터 삭제

CREATE TABLE deletedMemberTBL (
	memberID CHAR(8),
    memberName CHAR(5),
    memberAddress CHAR(20),
    deletedDate DATE -- 삭제한 날짜
    );
    
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL	-- 트리거 이름
	AFTER DELETE	-- 삭제 후에 작동하게 지정
    ON memberTBL	-- 트리거를 부착할 테이블
    FOR EACH ROW	-- 각 행마다 적용시킴
BEGIN
	-- OLD 테이블의 내용을 백업 테이블에 삽입
	INSERT INTO deletedMemberTBL VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
END //
DELIMITER ;

SELECT * FROM memberTBL;

DELETE FROM memberTBL WHERE memberName = '당탕이';

SELECT * FROM deletedMemberTBL;	-- 삭제된 당탕이의 데이터가 삽입됨.

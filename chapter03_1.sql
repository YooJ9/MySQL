SELECT * FROM productTBL;	-- SELECT문

SELECT memberName, memberAddress FROM memberTBL;	-- 회원 테이블 중 이름과 주소만 출력
SELECT * FROM memberTBL WHERE memberName = '지운이';	-- '지운이'에 대한 정보만 출력

CREATE TABLE `my TestTBL` (id INT);	-- my TestTBL 생성
DROP TABLE `my TestTBL`;			-- my TestTBL 삭제

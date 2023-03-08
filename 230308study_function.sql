use shopdb;
/*
날짜 및 시간 함수 : NOW(), CURDATE(), CURTIME(), YEAR(), 
MONTH(), DAY(), HOUR(), MINUTE(), SECOND(), DATE_FORMAT() 등
*/

SELECT now(); -- 현재 날짜, 시간
SELECT curdate(); -- 현재 날짜
SELECT curtime(); -- 현재 시간

-- String Function
SELECT ascii('U'); -- 아스키코드 반환
SELECT char_length('my sql test'); -- 글자수 반환(공백 포함)
SELECT concat('green', 'class', '100') as 'title'; -- 문자열 합치기
SELECT concat_ws('->', 'class', 'mysql', '홍길동'); -- 문자열 사이사이에 처음 넣은 문자열 삽입
SELECT find_in_set('q', 's,q,l');
SELECT format(2500.145, 2); -- 뒤의 숫자가 소숫점 자리수 
SELECT lcase('HELLO JAVA'); -- 소문자로 바꿔서 반환
SELECT ucase('hello java'); -- 대문자로 반환
SELECT trim('  MY S Q L '); -- 양 끝의 공백 제거해서 반환
SELECT replace('  MY S Q L ', ' ', ''); -- 문자열 대체 (ex>공백 없애기)
SELECT replace('  MY S Q L ', 'MY', 'YOUR');

-- MySQL Numberic function
SELECT * FROM buyTBL;
-- sum(): 총합
SELECT *, sum(price) as '총합' FROM buyTBL;
SELECT *, (SELECT sum(price) FROM buyTBL) AS '총합' FROM buytbl;
-- avg(): 평균값
SELECT *, avg(price) as '상품 평균 가격' FROM buytbl;
SELECT *, (SELECT avg(price) FROM buyTBL) AS '평균값' FROM buytbl;

SELECT ceil(25.12); -- 올림
SELECT round(25.55, 1); -- 반올림 콤마 뒤는 반올림하는 위치 기준
SELECT floor(25.75); -- 내림

SELECT max(price) FROM buytbl; -- 최대값
SELECT min(price) FROM buytbl; -- 최소값

SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
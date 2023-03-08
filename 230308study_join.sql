
CREATE DATABASE shopdb;
USE shopdb;
-- drop table usertbl;
CREATE TABLE userTBL(
	userName CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY (username)
);

ALTER TABLE userTBL MODIFY mobile VARCHAR(13);

CREATE TABLE buyTBL(
	userName CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(userName) REFERENCES userTBL(userName)
);

desc usertbl;
desc buytbl;

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);
-- 현재 부모테이블 username에 야스오라는 데이터가 없으므로 아래코드 실행 볼가
insert into buyTBL values('야스오', '책', 10, 3);

select * from usertbl;
select * from buytbl;

-- inner join
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userName = buyTBL.userName;

-- left join
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.userName = buyTBL.userName;

INSERT INTO userTBL VALUES
	('야스오', 2020, '부산', '010-1234-1234');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.userName = buyTBL.userName
WHERE buyTBL.userName IS NOT NULL;

-- AS (별칭) 사용해서 다시 INNER JOIN 작성

SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.userName = B.userName;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.userName = B.userName;

SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.userName = B.userName
WHERE B.userName IS NOT NULL;

-- left join 기준테이블 선정
-- 기준 테이블 선정에 따라 결과집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다.
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.userName = u.userName;

-- right join
SELECT u.userName, b.prodName, b.price, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.userName = b.userName;

-- 문제 3문제 작성
-- userTBL을 기준으로 buyTBL과 LEFT JOIN한 데이터중 userName이 이순신인 데이터
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName
WHERE u.userName = '이순신';
-- userTBL을 기준으로 buyTBL과 INNER JOIN한 데이터중 userTBL의 addr가 '부산'인 데이터
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE u.addr = '부산';
-- userTBL을 기준으로 buyTBL과 INNER JOIN한 데이터중 buyTBL의 amount가 1초과인 데이터
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.amount > 1;
-- 1
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE u.userName LIKE '이%' AND u.birthYear = 1999;
-- 2
SELECT u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.userName IS NOT NULL;
-- 3
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName;
-- 4
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.amount >= 3;
-- 5
SELECT *
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.userName = u.userName
WHERE u.userName IN('이승기','야스오') AND u.userName IS NOT NULL;
-- 6
SELECT b.amount
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.userName = u.userName
WHERE u.birthYear = 1999;
-- 7
SELECT u.userName, u.mobile
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.prodName = '책';
-- 8
SELECT *
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.userName = u.userName
WHERE u.addr = '대구';

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- 함수 사용하기
SELECT u.userName, b.prodName, b.price, 
		b.amount, b.price * b.amount as 'total price'
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.userName = b.userName;


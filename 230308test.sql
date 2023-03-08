CREATE DATABASE test;
use test;
-- 1. 학생 테이블 생성해주세요 
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL
);

-- 2. 상품 테이블 생성 하고 데이터 입력 쿼리 구문 작성  
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO product(name, price)
VALUES
	('갤럭시북', 130),
    ('LG 그램', 250);

-- 3. 상품 테이블과 1:N 관계를 가지는 구매 테이블을 생성 하시오  
CREATE TABLE buy(
	id INT PRIMARY KEY AUTO_INCREMENT,
    buy_date DATE NOT NULL,
    amount INT NOT NULL,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(id)
    );
    
-- 4.  구매 테이블에 데이터를 입력하시오
INSERT INTO buy(buy_date, amount, product_id)
VALUES
	('2023-03-01', 1, 2),
    ('2023-03-02', 2, 1),
    ('2023-03-03', 3, 2),
    ('2023-03-04', 4, 1);

-- 5. Inner join 구문을 사용해서 결과 집합 출력하기
SELECT *
FROM product AS p
INNER JOIN buy AS b
ON p.id = b.product_id;

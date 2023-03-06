-- NOT NULL, default값 사용

DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL
);

DESC student;

-- 디폴트 제약을 사용 했을 때 값을 넣는 방법 1
INSERT INTO student (student_id, name, grade, major)
VALUES
	(1, 'John', 3, '경영학과'),
    (2, 'Jane', 2, '경영학과'),
    (3, 'Mike', 1, DEFAULT),
    (4, 'David', 2, DEFAULT);
SELECT * FROM student;
-- 디폴트 제약을 사용 했을 때 값을 넣는 방법 2
INSERT INTO student (student_id, name, grade)
VALUES
	(5, '홍길동1', 2),
    (6, '홍길동2', 3),
    (7, '홍길동3', 1),
    (8, '홍길동4', 3);

-- proffessor 컬럼 제약사항을 default로 추가하고 값을 빈 문자열로 만들기
CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);

ALTER TABLE subject MODIFY professor VARCHAR(50) DEFAULT '' NOT NULL;

DESC subject;

-- DROP TABLE `order`;
CREATE TABLE `order` (
  id INT PRIMARY KEY,
  customer_order VARCHAR(50) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

-- 데이터를 입력하는 쿼리구문 작성하기
INSERT INTO `order`
VALUES
	(1, '현관문 앞에 놔두세요', '황금올리브치킨', 1, '2023-02-06');

INSERT INTO `order`
VALUES
	(2, '현관문 앞에 놔두세요', '황금올리브치킨', 1, 20230206);

-- 데이터타입에 값을 넣을 때 작은따옴표나 큰 따옴표를 사용해도 되고
-- 정수값을 입력하여도 된다. 단, 날짜 형식에 맞는 값이어야 한다.
INSERT INTO `order`
VALUES
	(2, '현관문 앞에 놔두세요', '황금올리브치킨', 1, 20232206);
    
INSERT INTO `order`
VALUES
	(2, '현관문 앞에 놔두세요', '황금올리브치킨', 1, '20230206');

SELECT * FROM `order`;

-- AUTO_INCREMENT: DEFAULT로 자동으로 증가하는 숫자 PK와 함께 자주 쓴다.
DROP TABLE customer;
CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);
INSERT INTO customer (name, email, address)
VALUES
	('김철수', 'a@naver.com', '서울시 강남구 역삼동'),
    ('박영희', 'b@naver.com', '서울시 강동구 천호동'),
    ('김철수', 'a@naver.com', '서울시 강남구 역삼동');
SELECT * FROM customer;

select * from drink;
alter table drink modify id int auto_increment;
desc drink;
insert into drink (id, name, capacity, quantity, can)
values
	(1, 'pepsi', 250, 100, 1);

insert into drink (name, capacity, quantity, can)
values
	('pepsi', 500, 100, 0),
    ('pepsi', 1250, 50, 0);
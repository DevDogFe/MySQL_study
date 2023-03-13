use shopdb;

-- 한학생이 수강과목을 여러개 듣는 n to n 설계
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
	student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 한사람이 여러개의 도시에서 여러번 여행을 다녀온 경우를 테이블로 구축하기

CREATE TABLE person(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE city(
	city_id INT PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE travel(
	person_id INT NOT NULL,
    city_id INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY(person_id, city_id, date),
    FOREIGN KEY(person_id) REFERENCES person(id),
    FOREIGN KEY(city_id) REFERENCES city(city_id)
);

INSERT INTO person VALUES
	(1, '김영희'),
    (2, '박철수'),
    (3, '이민호'),
    (4, '한지민'),
    (5, '송혜교');
    
INSERT INTO city VALUES
	(1, '서울'),
    (2, '부산'),
    (3, '제주'),
    (4, '홍콩'),
    (5, '도쿄');

INSERT INTO travel VALUES
	(1, 1, '2022-07-10'),
    (1, 2, '2022-07-11'),
    (2, 5, '2022-07-10'),
    (2, 4, '2022-07-13'),
    (3, 3, '2022-07-10'),
    (4, 5, '2022-07-10'),
    (1, 4, '2022-07-15');
    
SELECT *
FROM travel AS t
INNER JOIN person AS p
ON t.person_id = p.id
INNER JOIN city AS c
ON t.city_id = c.city_id;

-- 중복되는 컬럼명을 빼고 모든 테이블 inner join
SELECT t.person_id, t.city_id, t.date, p.name, c.name
FROM travel AS t
INNER JOIN person AS p
ON t.person_id = p.id
INNER JOIN city AS c
ON t.city_id = c.city_id;

-- 중복되는 컬럼명을 빼고 city_id가 4번이거나 5번인 데이터 left join
SELECT t.person_id, t.city_id, t.date, p.name, c.name
FROM travel AS t
LEFT JOIN person AS p
ON t.person_id = p.id
LEFT JOIN city AS c
ON t.city_id = c.city_id
WHERE t.city_id IN(4, 5);

desc person;
desc city;

-- 테이블 설계( 고객, 상품, 주문목록)
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE product(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE order_list(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id INT NOT NULL,
    product_id INT NOT NULL,
    amount INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

select * from buytbl;


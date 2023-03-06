
-- 데이터 베이스 생성
-- create database(데이터베이스 이름)
CREATE DATABASE mydb;
USE mydb; -- mydb 사용 (왼쪽창의 mydb 더블클릭해도 사용 가능)

-- 학생 테이블 생성하기
-- 테이블 생성시, SQL 작성시 어떤 DB를 사용해야 하는지 먼저 선택해야한다. (사용할 DB에 굵은색 확인)
-- 데이터타입선언은 ;가 아니라 ,로 구분한다. 마지막은 쓰지않음
-- VARCHAR(숫자): 데이터타입 문자(문자최대갯수)
-- INT: 정수값
-- NOT NULL 데이터 값 null 못넣게함
CREATE TABLE student(
	student_id INT,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);
-- 확인
SELECT * FROM student;
DESC student;

-- varchar() char() 차이점 괄호안의 숫자에 대한 데이터 처리 차이 varchar:가변, char:불변
-- 과목 테이블 생성하기
CREATE TABLE subject(
	subject_id INT,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(50),
    professor CHAR(50) NOT NULL
);
SELECT * FROM subject;
DESC subject;

-- 이미 생성된 테이블에 PK(고유키 제약조건) 추가
DESC student;
ALTER TABLE student ADD PRIMARY KEY(student_id);

-- subject 테이블에 pk 추가 대상 - subject_id
ALTER TABLE subject ADD PRIMARY KEY(subject_id);
DESC subject;

-- 생성된 시점 보기
SHOW CREATE TABLE student;

-- 테이블을 삭제하는 명령어 확인
DROP TABLE student;
DROP TABLE subject;

-- 학생 테이블 생성 PK추가alter
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);
DESC student;

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(10) NOT NULL,
    professor VARCHAR(20) NOT NULL
);

DESC subject;

-- 1. employee TABLE column(id, name, age, department) 포함 id열은 PK
CREATE TABLE employee(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(50) NOT NULL
);

desc employee;
desc customer;

-- 2. customer TABLE column(id, name, email, address) 포함 id열은 PK
CREATE TABLE customer(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address varchar(50)
);

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
DESC product;

-- 기본적으로 예약어(order)는 테이블 이름으로 사용 불가하다.
-- 하지만 ``(1키 왼쪽)사용하여 테이블 이름으로 명시할 수 있다.
CREATE TABLE `order`(
	id INT PRIMARY KEY,
    customer_order VARCHAR(50),
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL    
);
desc `order`;

CREATE TABLE drink(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    calorie INT,
    quantity INT NOT NULL,
    can BOOLEAN NOT NULL
);
DESC drink;
DROP TABLE drink;
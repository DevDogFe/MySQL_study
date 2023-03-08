-- DROP TABLE IF EXISTS member;
-- 회원정보
CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE member_grade(
	member_id INT PRIMARY KEY,
    grade VARCHAR(10),
    point INT,
    FOREIGN KEY(member_id) REFERENCES member(id)
);

desc member;
desc member_grade;

-- 직원과 직위 정보를 저장하는 테이블 설계(1:1)
CREATE TABLE employee(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE employee_position(
	id INT PRIMARY KEY,
    position VARCHAR(50) NOT NULL,
    fire_date DATE,
    FOREIGN KEY(id) REFERENCES employee(id)
);
-- drop table `order`;
-- drop table product;
CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT
);

CREATE TABLE product_detail(
	product_id INT PRIMARY KEY,
    description TEXT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);
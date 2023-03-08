-- drop table student;
-- drop table school;
CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(20) NOT NULL,
    city VARCHAR(20)
);

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT,
    FOREIGN KEY(school_id) references school(school_id)
);

insert into school values 
	(1, '서울대학교', '서울'),
	(2, '고려대학교', '서울'),
    (3, '연세대학교', '서울'),
    (4, '한양대학교', '서울');

insert into student values
	(1, '홍길동', '1학년', 1),
    (2, '김유신', '2학년', 2),
    (3, '이순신', '1학년', 3),
    (4, '유관순', '3학년', 1),
    (5, '안중근', '2학년', 4);

-- 제약 키(FK) 사용하게 되면 여러가지 제약사항이 생긴다.
insert into student(student_id, student_name, grade, school_id)
values
	(6, '야스오', '1학년', 10); -- 부모테이블의 PK가 1~4까지기 때문에 10은 생성 불가
-- Error Code: 1216. Cannot add or update a child row: a foreign key constraint fails

SELECT * FROM school;
SELECT * FROM student;
DESC student;

-- 야구팀과 야구선수 관계
CREATE TABLE team (
	id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE player(
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY(team_id) REFERENCES team(id)
);

INSERT INTO team VALUES
	(1, 'LG 트윈스'),
    (2, 'NC 다이노스'),
    (3, '두산 베어스');
    
INSERT INTO player VALUES
	(1, '허경민', 1),
    (2, '김하성', 2),
    (3, '최원준', 3);

SELECT * FROM team;
SELECT * FROM player;

-- 부서와 직원관계 설계
-- drop table employee;
CREATE TABLE department(
	id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(id)
);

-- drop table product;
-- drop table `order`;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);

INSERT INTO product VALUES
	(1, '노트북', 1000000),
    (2, '스마트폰', 700000),
    (3, '키보드', 50000);
    
INSERT INTO `order`(order_date, product_id)
VALUES
	('2022-02-15', 2),
    ('2022-02-16', 1),
    ('2022-02-17', 3);
    
SELECT * FROM `order`;
SELECT * FROM product;

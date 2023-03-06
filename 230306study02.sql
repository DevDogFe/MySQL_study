-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);

-- INSERT 기본 문구 모양: INSERT INTO 테이블명(컬럼명1, 컬럼명2, ..) VALUES(값1, 값2, ..);

INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (3, '이영희', 2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUE (4, '티모', 1, '롤학과');


-- 테이블에 데이터를 삭제하는 명령어 DELETE (테이블은 그대로 남음)
DELETE FROM student;

-- 복수형으로 INSERT 쿼리문 작성
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');
    
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1007, '이철수3', 1, '컴퓨터공학과'),
    (1008, '박영희3', 3, '수학과'),
    -- 쿼리문에 오류가 있으면 모든 데이터 처리 불가
    (1008, '최민수3', 4, '전자공학과');

SELECT * FROM  student;

-- 직원테이블, 고객테이블 스키마 확인하고 데이터 형식에 맞춰 5행이상 데이터 입력(단, 복수형)
DESC employee;
INSERT INTO employee(id, name, age, department)
VALUES
	(1001, '김가가', 25, '생산'),
    (1002, '이나나', 27, '마케팅'),
    (1003, '박다다', 29, '인사'),
    (1004, '최라라', 31, '개발'),
    (1005, '황마마', 33, '영업');
DESC customer;
INSERT INTO CUSTOMER(id, name, email, address)
VALUES
	(1001, '김가가', 'abc@email.com', '부산시 금정구'),
    (1002, '이나나', 'bbb@email.com', '양산시 명동'),
    (1003, '박다다', 'ccc@email.com', '서울시 동작구'),
    (1004, '최라라', 'ddd@email.com', '하동군 고전면'),
    (1005, '황마마', 'eee@email.com', '뉴욕 월스트리트');
    
select * from employee;
select * from customer;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    product_type VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO product(id, name, product_type)
values
	(1, '다간', '장난감로봇'),
	(2, '기타', '악기'),
    (3, '컴퓨터', '전자기기');

DESC product;
select * from product;
desc student;
select * from student;
-- 이미생성된 테이블 제약사항 변경하기
-- ALTER TABLE <테이블명> MODIFY <컬럼명> <데이터타입> <제약사항>;
ALTER TABLE student MODIFY grade INT NULL;

INSERT INTO student(student_id, name, major)
VALUES(1, '홍길동', '검술학과');

ALTER TABLE student MODIFY grade INT NOT NULL;

select * from student;
DESC student;

-- 하나의 행을 삭제 where절(조건절) 
DELETE FROM student WHERE student_id = 1;

-- major 컬럼 제약을 not null로 변경

ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;

-- 컬럼 선언 부분을 생략도 가능하다. 단 전부 값을 넣으려는 상황일 때
INSERT INTO student VALUES(2, '홍길동2', 3, '검술학과');

-- insert 구문 컬럼명 선언 방식 
-- 전부 작성하는 방법
-- 제약사항이 null인 열이 있다면 넣고싶은 열만 지정해서 구문을 작성할 수 있다.
-- 전부 데이터를 넣는 상황이라면 컬럼 선언부분을 생략할 수 있다.
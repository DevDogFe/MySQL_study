-- DROP TABLE student;

CREATE TABLE student(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(20) NOT NULL
);

SELECT * FROM student;

INSERT INTO student(student_id, name, grade, major)
VALUES (1, '김철수', 3, '컴퓨터공학과');

INSERT INTO student (student_id, name, grade, major)
VALUES
  (2, '박영희', 2, '경영학과'),
  (3, '이민수', 4, '전자공학과'),
  (4, '홍길동', 1, '디자인학과'),
  (5, '임성민', 3, '컴퓨터공학과'),
  (6, '한지원', 2, '경영학과'),
  (7, '박준형', 4, '전자공학과'),
  (8, '김민지', 1, '디자인학과'),
  (9, '이현수', 3, '컴퓨터공학과'),
  (10, '정미경', 2, '경영학과'),
  (11, '김성진', 4, '전자공학과'),
  (12, '임승환', 1, '디자인학과');

DESC student;

-- where 사용하기

-- student 테이블에서 컴공과 학생의 이름과 학번 조회하기

SELECT student_id, name
FROM student
WHERE major = '컴퓨터공학과';

-- student grade = 3 조회

SELECT * 
FROM student
WHERE grade = 3;

-- 이름이 홍길동인 학생 조회하기

SELECT *
FROM student
WHERE name = '홍길동';

-- 학번이 1부터 10까지인 학생 조회
SELECT *
FROM student
WHERE student_id BETWEEN 1 AND 10;

-- 학과가 컴퓨터공학과이고 학년이 2학년인 학생들만 조회
SELECT *
FROM student
WHERE major = '디자인학과' AND grade = 1;

-- 학과가 컴퓨터공학과이거나 학년이 2학년인 학생 조회
SELECT *
FROM student
WHERE major = '컴퓨터공학과' OR grade = 2;

-- 학생이름이 홍길동이 아닌 학생들 조회
SELECT *
FROM student
WHERE name != '홍길동';

SELECT *
FROM sTUDEnt
WHERE NAME <> '홍길동';

-- 학년이 2학년 이상인 학생 조회
SELECT *
FROM student
WHERE grade >= 2;

-- 학년이 2학년 미만
SELECT *
FROM student
WHERE grade < 2;

-- 학년이 1학년 이거나 3학년인 학생들 조회
SELECT *
FROM student
WHERE grade = 1 or grade = 3;

SELECT *
FROM student
WHERE grade IN(1, 3);

-- DROP TABLE subject;
-- DROP TABLE customer;

CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);


CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);

-- subject 테이블 샘플 데이터 

INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');


-- customer 샘플 데이터 

INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

desc customer;
desc subject;

-- 과목이름이 미국사 데이터 조회
SELECT *
FROM subject
WHERE subject_name = '미국사';
-- 학점이 3학점인 과목 조회
SELECT *
FROM subject
WHERE credit = 3;
-- 국어국문학과에서 개설된 과목 데이터 조회
SELECT *
FROM subject
WHERE department = '국어국문학과';
-- 과목이름이 영어회화 이거나 교수명이 이승호
SELECT *
FROM subject
WHERE subject_name = '영어회화' OR professor = '이승호';

-- 과목번호가 5보다 큰 데이터
SELECT *
FROM subject
WHERE subject_id > 5;
-- 과목 이름이 '데이터베이스 개론'이 아닌 데이터
SELECT *
FROM subject
	 -- MySQL의 문자열값을 다룰 때는 공백도 하나의 값으로 생각한다.
WHERE subject_name != '데이터베이스 개론';
-- 학과 '컴퓨터공학과' 교수명 '박철수' 조회
SELECT *
FROM subject
WHERE department = '컴퓨터공학과' AND professor = '박철수';

-- 교수명이 '김현진'이거나 '최영식'이면서 학과가 '외국어학과인 과목 데이터
SELECT *
FROM subject
WHERE professor IN('김현진', '최영식') 
	AND department = '외국어학과';
SELECT *
FROM subject
WHERE (professor = '김현진' OR professor = '최영식') 
	AND department = '외국어학과';
    
SELECT * FROM customer;

-- ID가 2 이상 8이하 조회
SELECT *
FROM customer
WHERE id BETWEEN 2 AND 8;
-- 주소가 서울시 조회
SELECT *
FROM customer
WHERE address LIKE '서울시%';
-- 메일이 있는 고객 조회
SELECT *
FROM customer
WHERE email != '';
-- 강남3구 사는 사람 조회
SELECT *
FROM customer
WHERE address IN('서울시 서초구', '서울시 송파구', '서울시 강남구');
-- ID 홀수 조회
SELECT *
FROM customer
WHERE id IN (1,3,5,7,9);

-- ID가 5이상이며 서울시 거주
SELECT *
FROM customer
WHERE id >= 5 AND address LIKE '서울시%';
-- EMAIL이 NULL
SELECT *
FROM customer
WHERE email IS NULL;
-- EMAIL NULL 아니고 번호가 2번 넘으면서 종로구
SELECT *
FROM customer
WHERE email IS NOT NULL AND id > 5 AND address = '서울시 종로구';
-- id 3~8 경기도 의정부 이메일 입력
SELECT *
FROM customer
WHERE id BETWEEN 3 AND 8 AND address = '경기도 의정부시' AND email IS NOT NULL;
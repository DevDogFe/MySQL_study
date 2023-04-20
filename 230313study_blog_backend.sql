
use mydb;
show TABLES;

SELECT * FROM customer;
use myblog;

-- user 테이블 생성
-- id: pk부여
-- username: 사용자 이름 100자 not null, 중복 허용 불가
-- password: 100자 not null
-- email: 100자 not null
-- address: 100자
-- userRole: ADMIN, MANAGER, USER
-- createDate

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);

-- 블로그 사이트

CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB, -- 대용량 데이터 BLOB>LONGTEXT>TEXT
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);
SELECT * FROM board;

-- 댓글 테이블
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);

INSERT INTO user(username, password, email, address, userRole, createDate) VALUES
 ('홍길동', '1234', 'a@naver.com', '부산시 중구', 'USER', now());
 
SELECT * FROM user;
SELECT * FROM user
WHERE username = '홍길동' AND password = '1234'; 
-- user:board -> 1:N
INSERT INTO board(title, content, userId) VALUES
('첫번째 게시글', '자바는 쉬운거에요', 3);

SELECT * FROM board;
SELECT * FROM board
WHERE id = 1;
ALTER TABLE board MODIFY content text;

DELETE FROM board
WHERE id = 3;

UPDATE board SET password = ?, email = ?, address = ?
WHERE id = 2;

show tables;

SELECT *
FROM board;
INSERT INTO board(id, title, content, userId) VALUES
	(1, '1빠', '냉무', 3),
    (2, '2빠', '냉무', 2),
    (3, '3빠', '냉무', 1),
    (4, '4빠', '냉무', 3);
    
    
DELETE FROM board
WHERE id = 50;
UPDATE board SET title = 'test 1', content = 'test content1'
WHERE id = 5;

SELECT * FROM user;
DELETE FROM user
WHERE id = 13;
SELECT b.id, b.title, b.readCount, b.userId, u.username
FROM board AS b
LEFT JOIN user AS u
ON b.userId = u.id;
SELECT * FROM user WHERE id = 1;
SELECT * FROM board;


select * from board 
order by id desc LIMIT 20 OFFSET 0 ;

SELECT b.id, b.title, b.readCount, b.userId, u.username
FROM board AS b
LEFT JOIN user AS u
ON b.userId = u.id
ORDER BY b.id desc
LIMIT 20 OFFSET 0;

show tables;
select * from numbers;
desc reply;

SELECT b.id, b.title, b.readCount, b.userId, u.username
FROM board AS b
LEFT JOIN user AS u
ON b.userId = u.id
WHERE b.userId = 1
ORDER BY b.id desc
LIMIT 20 OFFSET 0;

SELECT * FROM employees;
DESC departments;
DESC dept_emp;
SELECT * FROM dept_emp;


-- employees DB에서 부서원들의 이름과 현재 소속된 부서를 입사순으로 정렬해서 표시
SELECT e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
LEFT JOIN employees AS e
ON de.emp_no = e.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.hire_date;

select * from salaries;
select * from titles;

-- 지금현재 sales 부서에 속한 직원의 풀네임과 현재 title 조회
SELECT e.first_name, e.last_name, t.title
FROM dept_emp AS de
LEFT JOIN employees AS e
ON de.emp_no = e.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
LEFT JOIN titles AS t
ON de.emp_no = t.emp_no
WHERE d.dept_name = 'Sales' AND de.to_date = '9999-01-01' AND t.to_date = '9999-01-01';

DESC users;
desc userspoint;
desc board;
desc reply;
DESC numbers;
SELECT * FROM userspoint;

SELECT p.userId, u.username, p.weekPoint, p.monthPoint, p.totalPoint FROM usersPoint AS p LEFT JOIN users AS u ON p.userId = u.id ORDER BY weekPoint DESC LIMIT 20;

SELECT * FROM dept_emp AS de
LEFT JOIN employees AS e
ON de.emp_no = e.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
LEFT JOIN salaries AS s
ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 50;

-- employ테이블의 현재 연봉 상위 50명 뽑아 부서번호 기준으로 정렬하고, 그 안에서 연봉 기준으로 내림차순 정렬하기
SELECT * FROM(
	SELECT de.emp_no, de.dept_no, d.dept_name, e.first_name, s. salary FROM dept_emp AS de
	LEFT JOIN employees AS e
	ON de.emp_no = e.emp_no
	LEFT JOIN departments AS d
	ON de.dept_no = d.dept_no
	LEFT JOIN salaries AS s
	ON de.emp_no = s.emp_no
	WHERE s.to_date = '9999-01-01'
	ORDER BY s.salary DESC
	LIMIT 50
) AS top50
ORDER BY dept_no, salary DESC;

SELECT * FROM dept_manager WHERE to_date = '9999-01-01';


SELECT * FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
LEFT JOIN dept_manager AS d
ON e.emp_no = d.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY s.salary DESC;

(SELECT '1985salaryAvg' AS hireYear, avg(salary) AS salaryAvg FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE hire_date LIKE '1985%' AND to_date = '9999-01-01');

(SELECT '1990salaryAvg' AS hireYear, avg(salary) AS salaryAvg FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE hire_date LIKE '1990%' AND to_date = '9999-01-01');

-- 1985년에 입사한 직원들의 현재 연봉과 1990년에 입사한 직원들의 현재 연봉을 테이블로 나타내기
SELECT *
FROM (
SELECT '1985년입사' AS hireYear, avg(salary) AS salaryAvg FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE hire_date LIKE '1985%' AND to_date = '9999-01-01'
) AS 1985salary
UNION
SELECT *
FROM (
SELECT '1990년입사' AS hireYear, avg(salary) AS salaryAvg FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE hire_date LIKE '1990%' AND to_date = '9999-01-01'
) AS 1990salary;


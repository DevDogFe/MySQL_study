CREATE DATABASE university_management_sys;
USE university_management_sys;

CREATE TABLE user_tb(
	id INT PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    user_role VARCHAR(10) NOT NULL
);

CREATE TABLE student_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    gender CHAR(1) NOT NULL COMMENT '남자: M, 여자: F',
    address VARCHAR(100) NOT NULL,
    tel VARCHAR(13) NOT NULL,
    dept_id INT NOT NULL,
    foreigner CHAR(1) COMMENT '외국인: Y, 아니면 null',
    entrance_date DATE NOT NULL,
    graduation_date DATE
);

ALTER TABLE student_tb AUTO_INCREMENT = 2023000001;

CREATE TABLE staff_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    hire_date DATE DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE staff_tb AUTO_INCREMENT = 230001;

CREATE TABLE professor_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    hire_date DATE DEFAULT CURRENT_TIMESTAMP,
    department_id INT NOT NULL
);

ALTER TABLE professor_tb AUTO_INCREMENT = 23000001;

CREATE TABLE subject_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    professor_id INT NOT NULL,
    room_id VARCHAR(5),
    department_id INT NOT NULL,
    subject_type VARCHAR(2) NOT NULL COMMENT '전공/교양',
    semester VARCHAR(6) NOT NULL COMMENT 'ex) 2023년도 1학기 -> 2023-1',
    time VARCHAR(35) NOT NULL,
    grades INT NOT NULL COMMENT '전공: 3 교양: 2',
    capacity INT NOT NULL COMMENT '정원',
    -- 실제 신청한 학생 수
    number_of_student INT NOT NULL DEFAULT 0
);
-- 과목 id 10000부터
ALTER TABLE subject_tb AUTO_INCREMENT = 10000;

CREATE TABLE room_tb(
	id VARCHAR(5) PRIMARY KEY,
    college_id INT NOT NULL
);

CREATE TABLE college_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE department_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL UNIQUE,
    college_id INT NOT NULL
);

ALTER TABLE department_tb AUTO_INCREMENT = 100;

CREATE TABLE pre_stu_sub_tb(
	student_id INT NOT NULL,
    subject_id INT NOT NULL
    -- grade 뺌 희망수업에 성적 있을 필요 없으니까
);

CREATE TABLE stu_sub_tb(
	student_id INT NOT NULL,
    subject_id INT NOT NULL,
    grade VARCHAR(2)
);

CREATE TABLE stu_stat(
	student_id INT NOT NULL,
	status VARCHAR(3) NOT NULL,
    from_date DATE,
    to_date DATE
);

CREATE TABLE scholarship(
	student_id INT NOT NULL,
    semester VARCHAR(6) NOT NULL,
    scholar_type VARCHAR(3) NOT NULL
);

CREATE TABLE notice_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    views INT NOT NULL DEFAULT 0,
    filename VARCHAR(255)
);

-- 점수 환산 테이블
CREATE TABLE grade_tb(
	grade VARCHAR(2) NOT NULL PRIMARY KEY,
    grade_value FLOAT NOT NULL
);

-- 스태프 생성 예시
INSERT INTO staff_tb (name) VALUES
(김지현);
SELECT id
FROM staff_tb
ORDER BY id DESC
LIMIT 1;

INSERT INTO user_tb VALUES
(
(
	SELECT id
	FROM staff_tb
	ORDER BY id DESC
	LIMIT 1),
(
	SELECT id
	FROM staff_tb
	ORDER BY id DESC
	LIMIT 1),
'staff');
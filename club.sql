use test;
drop table student;

CREATE TABLE student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(5) NOT NULL,
    major VARCHAR(10) NOT NULL
);

CREATE TABLE club(
	club_id INT PRIMARY KEY AUTO_INCREMENT,
    club_name VARCHAR(10) UNIQUE,
    club_type VARCHAR(10) NOT NULL,
    club_room VARCHAR(10)
);

CREATE TABLE club_member_list(
	club_id INT,
    student_id INT,
    join_date DATE NOT NULL,
    PRIMARY KEY(club_id, student_id),
    FOREIGN KEY(club_id) REFERENCES club(club_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);

DROP TABLE club_member_list;

INSERT INTO student(student_name, major) VALUES
('피카츄', '경영학과'),
('라이츄', '경영학과'),
('파이리', '경제학과'),
('꼬부기', '경제학과'),
('버터플', '국어국문학과'),
('야도란', '사회학과'),
('피죤투', '심리학과'),
('또가스', '통계학과');

INSERT INTO student(student_name, major) VALUES
('스랄', '컴퓨터공학과'),
('제이나', '신소재공학과'),
('렉사르', '전자공학과'),
('굴단', '기계공학과'),
('안두인', '신학과'),
('볼진', '신학과'),
('바인', '기계공학과'),
('발리라', '컴퓨터공학과');

INSERT INTO club(club_id, club_name, club_type, club_room) VALUES
(100, 'FC바르셀로나', '축구', 'A101');

INSERT INTO club(club_name, club_type, club_room) VALUES
('레알마드리드', '축구', 'A103'),
('LA레이커스', '농구', 'A202'),
('골든스테이트', '농구', 'A104'),
('시나위', '밴드', 'B103'),
('자우림', '밴드', 'B201'),
('유니세프', '봉사', 'A301'),
('뉴욕양키스', '야구', 'A401');

ALTER TABLE club_member_list
ADD join_date DATE NOT NULL;

INSERT INTO club_member_list VALUES
(100, 1, '2023-03-02'),
(103, 2, '2023-03-03'),
(105, 3, '2023-03-04'),
(107, 4, '2023-03-03'),
(102, 5, '2023-03-02'),
(104, 6, '2023-03-04'),
(106, 7, '2023-03-05'),
(101, 8, '2023-03-03'),
(104, 9, '2023-03-07'),
(107, 10, '2023-03-06'),
(102, 11, '2023-03-02'),
(105, 12, '2023-03-03'),
(103, 13, '2023-03-02'),
(106, 14, '2023-03-02'),
(100, 15, '2023-03-03'),
(100, 16, '2023-03-02'),
(105, 1, '2023-03-04'),
(102, 3, '2023-03-02'),
(101, 5, '2023-03-05'),
(107, 7, '2023-03-02'),
(106, 9, '2023-03-04'),
(101, 11, '2023-03-05');

INSERT INTO club_member_list VALUES
(104, 6, curdate());

SELECT c.club_id, c.club_name, s.student_id, s.student_name, s.major
FROM club AS c
LEFT JOIN club_member_list AS l
ON c.club_id = l.club_id
LEFT JOIN student AS s
ON l.student_id = s.student_id
WHERE c.club_id = 101
ORDER BY s.student_id;

SELECT c.club_name, count(student_id) AS count
FROM club_member_list AS l
LEFT JOIN club AS c
ON l.club_id = c.club_id
GROUP BY l.club_id
HAVING c.club_name = '시나위';

SELECT * FROM student;
SELECT * FROM club;
SELECT * FROM club_member_list;

DELETE FROM club_member_list 
WHERE club_id = 104 AND student_id = 6 AND join_date = '2023-03-10';



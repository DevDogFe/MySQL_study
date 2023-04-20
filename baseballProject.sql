CREATE DATABASE baseball;

USE baseball;

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(40) NOT NULL UNIQUE,
    username VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(15) NOT NULL,
    userRole VARCHAR(10) NOT NULL DEFAULT 'USER',
    createDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users(email, username, password) VALUES
('b@test.com', '박길동', 'asd1234');

SELECT * FROM users;

CREATE TABLE usersPoint(
	userId INT PRIMARY KEY,
    weekPoint INT NOT NULL DEFAULT 0,
    monthPoint INT NOT NULL DEFAULT 0,
    totalPoint INT NOT NULL DEFAULT 0,
    FOREIGN KEY(userId) REFERENCES users(id)
);

INSERT INTO usersPoint VALUES
(1, 0, 0, 0);

-- 가입시 유저포인트 테이블 만들기
INSERT INTO userspoint(userId) VALUES (3);
-- 전체 조회
SELECT * FROM usersPoint;
SELECT p.userId, u.username, p.weekPoint, p.monthPoint, p.totalPoint FROM usersPoint AS p LEFT JOIN users AS u ON p.userId = u.id ORDER BY weekPoint DESC LIMIT 20;
-- 유저 조회
SELECT * FROM userspoint WHERE userId = 1;
-- 유저 점수 획득
UPDATE usersPoint 
SET weekPoint = weekPoint +50, monthPoint = monthPoint + 50, totalPoint = totalPoint + 50
WHERE userId = 1;
-- 주간 점수 초기화
-- UPDATE usersPoint
-- SET weekPoint = 0;
-- 월간 점수 초기화
-- UPDATE usersPoint
-- SET monthPoint = 0;

CREATE TABLE numbers(
	userId INT NOT NULL,
    num1 INT NOT NULL,
    num2 INT NOT NULL,
    num3 INT NOT NULL
);
ALTER TABLE numbers ADD tryCount INT NOT NULL DEFAULT 0;
ALTER TABLE numbers MODIFY userId INT NOT NULL PRIMARY KEY;

 -- 정답숫자 담아두는 용도
 INSERT INTO numbers(userId, num1, num2, num3) VALUES (?, ?, ?, ?);
 -- 정답확인용
 SELECT * FROM numbers WHERE userId = ?;
 -- 게임 종료 후 삭제
 DELETE FROM numbers WHERE userId = ?;
 -- tryCOunt++
 UPDATE numbers SET tryCount = tryCount + 1 WHERE userId = ?;
 SELECT * FROM numbers;
 SELECT * from userspoint;
 SELECT * FROM users;
 DESC numbers;
 
 -- user 정보 수정
 UPDATE users SET username = '가나바', password = 'gksrmf' WHERE id = 6;
 DELETE FROM users WHERE id = ?;
 
-- 게시판 테이블
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    userId INT NOT NULL,
    createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views INT NOT NULL DEFAULT 0,
    FOREIGN KEY(userId) REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DESC board;
SELECT * FROM board;

-- create
INSERT INTO board (title, content, userId) VALUES
('제목', '내용', '1');
-- 게시글 목록 보기
SELECT b.id, b.title, b.views, b.userId, u.username 
FROM board AS b LEFT JOIN users AS u ON b.userId = u.id
ORDER BY id DESC LIMIT 0, 10;
-- 글 조회
SELECT * FROM board WHERE id = 1;
-- 글 수정
UPDATE board SET title = ?, content = ? WHERE id = ?;



-- 댓글 테이블
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR (255) NOT NULL,
    userId INT NOT NULL,
    boardId INT NOT NULL,
    createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(boardId) REFERENCES board(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(userId)  REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE    
);

-- 댓글 생성
INSERT INTO reply(content, userId, boardId) VALUES ('댓글 내용', 2, 2);
-- 댓글 보이기
SELECT r.id, r.content, r.userId, u.username, r.boardId, r.createTime FROM reply AS r
LEFT JOIN users AS u ON r.userId = u.id WHERE boardId = 2;
SELECT * FROM reply;
-- 댓글 수정
UPDATE reply SET content = '내용' WHERE id = 1;
-- 댓글 삭제
DELETE FROM reply WHERE id = 1;

SELECT count(*) AS boardCount from board;
UPDATE board SET views = views + 1 WHERE id = 2;

SELECT count(*) AS replyCount FROM reply WHERE boardId = 14;
select count(*) AS count FROM users WHERE email= 'a@test.com';

DESC users;
DESC userspoint;
DESC numbers;
DESC board;
DESC reply;

SELECT * FROM numbers;

SELECT * FROM board;





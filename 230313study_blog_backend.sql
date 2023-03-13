
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
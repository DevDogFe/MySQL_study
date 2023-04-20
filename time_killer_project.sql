

-- 유저 정보 테이블
CREATE TABLE user_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    nickname VARCHAR(10) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 유저 포인트 테이블
CREATE TABLE user_point_tb(
	user_id INT PRIMARY KEY,
    week_point INT DEFAULT 0,
    total_point INT DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

CREATE TABLE bj_deck_tb(
	user_id INT PRIMARY KEY,
    card1 INT NOT NULL,
    card2 INT NOT NULL,
    card3 INT NOT NULL,
    card4 INT NOT NULL,
    card5 INT NOT NULL,
    card6 INT NOT NULL,
    card7 INT NOT NULL,
    card8 INT NOT NULL,
    card9 INT NOT NULL,
    card10 INT NOT NULL,
	card11 INT NOT NULL,
    card12 INT NOT NULL,
    card13 INT NOT NULL,
    card14 INT NOT NULL,
    card15 INT NOT NULL,
    card16 INT NOT NULL,
    card17 INT NOT NULL,
    card18 INT NOT NULL,
    card19 INT NOT NULL,
    card20 INT NOT NULL,
	card21 INT NOT NULL,
    card22 INT NOT NULL,
    card23 INT NOT NULL,
    card24 INT NOT NULL,
    card25 INT NOT NULL,
    card26 INT NOT NULL,
    card27 INT NOT NULL,
    card28 INT NOT NULL,
    card29 INT NOT NULL,
    card30 INT NOT NULL,
	card31 INT NOT NULL,
    card32 INT NOT NULL,
    card33 INT NOT NULL,
    card34 INT NOT NULL,
    card35 INT NOT NULL,
    card36 INT NOT NULL,
    card37 INT NOT NULL,
    card38 INT NOT NULL,
    card39 INT NOT NULL,
    card40 INT NOT NULL,
	card41 INT NOT NULL,
    card42 INT NOT NULL,
    card43 INT NOT NULL,
    card44 INT NOT NULL,
    card45 INT NOT NULL,
    card46 INT NOT NULL,
    card47 INT NOT NULL,
    card48 INT NOT NULL,
    card49 INT NOT NULL,
    card50 INT NOT NULL,
	card51 INT NOT NULL,
    card52 INT NOT NULL,
    card53 INT NOT NULL,
    card54 INT NOT NULL,
    card55 INT NOT NULL,
    card56 INT NOT NULL,
    card57 INT NOT NULL,
    card58 INT NOT NULL,
    card59 INT NOT NULL,
    card60 INT NOT NULL,
	card61 INT NOT NULL,
    card62 INT NOT NULL,
    card63 INT NOT NULL,
    card64 INT NOT NULL,
    card65 INT NOT NULL,
    card66 INT NOT NULL,
    card67 INT NOT NULL,
    card68 INT NOT NULL,
    card69 INT NOT NULL,
    card70 INT NOT NULL,
	card71 INT NOT NULL,
    card72 INT NOT NULL,
    card73 INT NOT NULL,
    card74 INT NOT NULL,
    card75 INT NOT NULL,
    card76 INT NOT NULL,
    card77 INT NOT NULL,
    card78 INT NOT NULL,
    card79 INT NOT NULL,
    card80 INT NOT NULL,
	card81 INT NOT NULL,
    card82 INT NOT NULL,
    card83 INT NOT NULL,
    card84 INT NOT NULL,
    card85 INT NOT NULL,
    card86 INT NOT NULL,
    card87 INT NOT NULL,
    card88 INT NOT NULL,
    card89 INT NOT NULL,
    card90 INT NOT NULL,
	card91 INT NOT NULL,
    card92 INT NOT NULL,
    card93 INT NOT NULL,
    card94 INT NOT NULL,
    card95 INT NOT NULL,
    card96 INT NOT NULL,
    card97 INT NOT NULL,
    card98 INT NOT NULL,
    card99 INT NOT NULL,
    card100 INT NOT NULL,
	card101 INT NOT NULL,
    card102 INT NOT NULL,
    card103 INT NOT NULL,
    card104 INT NOT NULL,
    deal_count INT DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE bj_users_card_tb(
	user_id INT NOT NULL,
    card1 INT,
    card2 INT,
    card3 INT,
    card4 INT,
    card5 INT,
    card6 INT
);

CREATE TABLE bj_dealers_card_tb(
	user_id INT NOT NULL,
    card1 INT,
    card2 INT,
    card3 INT,
    card4 INT,
    card5 INT,
    card6 INT
);

CREATE TABLE hm_words_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    word VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE hm_users_word_tb(
	user_id INT PRIMARY KEY,
    word_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user_tb(id),
    FOREIGN KEY(word_id) REFERENCES hm_words_tb(id)
);

CREATE TABLE bb_numbers_tb(
	userId INT PRIMARY KEY NOT NULL,
    num1 INT NOT NULL,
    num2 INT NOT NULL,
    num3 INT NOT NULL
);

CREATE TABLE board_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(10) NOT NULL,
    title VARCHAR(20) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views INT NOT NULL DEFAULT 0,
    file1 VARCHAR(255),
    file2 VARCHAR(255),
    FOREIGN KEY(user_id) REFERENCES user_tb(id)
);

CREATE TABLE board_recommanded_tb(
	board_id INT NOT NULL,
	user_id INT NOT NULL,
    PRIMARY KEY(board_id, user_id),
    FOREIGN KEY(board_id) REFERENCES board_tb(id),
    FOREIGN KEY(user_id) REFERENCES user_tb(id)
);
-- 추천 수 불러오기 SELECT count(board_id) FROM board_recommanded_tb WHERE board_id = ?



	
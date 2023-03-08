CREATE TABLE movie (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(20) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(20) NOT NULL,
    rating DOUBLE NOT NULL
);

INSERT INTO movie VALUES
	(1, '괴물', '봉준호', '2006-07-27', '드라마', 8.28),
    (2, '극한직업', '이병헌', '2019-01-23', '코미디', 9.20),
    (3, '명량', '김한민', '2014-07-30', '사극', 9.17),
    (4, '신과함께-죄와 벌', '김용화', '2017-12-20', '판타지', 7.56),
    (5, '밀양', '임권택', '2016-09-07', '드라마', 7.76),
    (6, '반도', '연상호', '2020-07-15', '액션', 6.71),
    (7, '베테랑', '류승완', '2015-08-05', '액션', 8.49),
    (8, '변호인', '양우석', '2013-12-18', '드라마', 8.41),
    (9, '군함도', '류승완', '2017-07-26', '사극', 8.01),
    (10, '암살', '최동훈', '2015-07-22', '액션', 8.37);
    
SELECT * FROM movie;
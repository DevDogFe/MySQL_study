CREATE DATABASE myblog;
use myblog;

-- 사용자 생성
-- CREATE USER <사용자명>@'주소' IDENTIFIED BY '비밀번호'
CREATE USER 'bloguser'@'%' IDENTIFIED BY '1q2w3e4r5t';
-- 사용자 기본 권한 조회
-- DB를 선택 mysql
use mysql;
SELECT user, host from user; -- host:'%' 어디서든 접근 가능한 권한(IP주소 개념)
SELECT * FROM user WHERE user = 'bloguser';
-- 사용자 권한 설정
GRANT ALL PRIVILEGES ON *.* TO 'bloguser'@'%';
-- 방금 권한 변경을 즉시 적용
FLUSH PRIVILEGES;

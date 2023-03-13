CREATE DATABASE myblog;
use myblog;

-- 사용자 생성
-- CREATE USER <사용자명>@'주소' IDENTIFIED BY '비밀번호'
CREATE USER 'bloguser'@'%' IDENTIFIED BY '1q2w3e4r5t';
-- 사용자 권한 설정

select name 
     , lower(name) -- 데이터 모두 소문자로 변환
     , upper(name) -- 데이터 모두 대문자로 변환
  from professor;
-- dual : 임시테이블
select 1
  from dual;
-- abs : 절대값
select abs(-352)
  from dual;
-- length : 문자 길이
select ENAME
     , length(ename)
  from emp;
-- 영문은 1자에 1byte, 한글은 1자에 3byte이므로 한글은 1자에 3자로 인식
select '홍길동'
	 , 'gildong'
     , length('홍길동')
     , length('gildong')
  from dual;
-- 데이터 합치기
select ename
	 , job
     , concat(ename, job)
  from emp;
select ename
	 , job
     , substr(job, 3, 2) -- 3번째 자리에서 2글자
     , substr(job, 1, 2) -- 1번째 자리에서 2글자
     , substr(job, 0, 2) -- 인식 못함(오라클에서는 1,2와 결과 동일)
     , substr(job, 1) -- 뒷 숫자 생략하면 끝까지
     , substr(job, 3) -- 뒷 숫자 생략하면 끝까지
     , substr(job, 6, 2) 
     , substr(job, -3, 2) -- 뒤에서부터 3번째 자리에서 2글자
  from emp;
select 'A-B-C-D'
      -- 오류
  -- , instr('A-B-C-D') -- ERROR
	 , instr('A-B-C-D', '-') -- 하이픈(-)이 처음으로 나오는 위치
  -- , instr('A-B-C-D', '-', 3) -- ERROR (오라클에서는 위의 결과와 동일)
  from dual;

select name
     , ID
     -- ID를 10자리로 표시하고 기존 데이터길이가 10보다 낮다면 모자라는 부분을 데이터 왼쪽에 *로 채움
     , lpad(ID, 10, '*')
  FROM STUDENT;
select ENAME
	 -- '-' 오늘쪽에 채움
     , rpad(ENAME, 10, '-')
  FROM EMP;
select ENAME
     , substr(ENAME, 1, 2)
     -- 제일 앞 2글자를 **으로 변경
     , REPLACE(ENAME, substr(ENAME, 1, 2), '**') 
  FROM EMP;
  
  -- 4장
  -- 테이블 생성 : create table + 테이블명
create table NEW_TABLE
-- NO: 컬럼이름, INT: 데이터타입
(NO INT
,NAME varchar(10) -- VARCHAR(숫자): 문자 가변형, CHAR(숫자): 문자 고정형
,BIRTH date); -- DATE: 가변형
select * FROM NEW_TABLE;
-- 테이블 삭제
DROP TABLE NEW_TABLE;
-- 테이블 복사 (데이터 백업용)
create table dept3
as
select * from dept2;
select * from dept3;
-- 테이블 복사 (컬럼 2개만)
create table dept4
as
select DCODE, DNAME from dept2;
select * from dept4;
-- 테이블 구조만 복사 : 구조만 가져오기 위해 거짓 조건 추가
create table dept5
as
select * from dept2
where 1=2;
select * from dept5;

select DCODE, DNAME
  from dept2;
-- 전체 건수 : 13건
select count(*)
  from dept2
 where DCODE in (1000, 1001, 1002); -- 3건
-- 조건절로 필요한 데이터만으로 테이블 복사 (컬럼2개, 데이터 3개)
create table dept6
as
select DCODE
     , DNAME
  from dept2
 where DCODE in (1000, 1001, 1002);
select * from dept6;
-- 컬럼 추가 -> location: 컬럼명, varchar(10): 데이터타입
alter table dept6
add (location varchar(10));
-- 컬럼 추가하면서 데이터 기본값 추가 (default '내용')
alter table dept6
add (location2 varchar(10) default 'SEOUL');
-- 컬럼명 변경
alter table dept6
rename column loc TO LOC;
-- 테이블명 변경
rename table dept6 to dept7;
select * from dept7;
-- LOC : varchar(10)
desc dept7;
-- 데이터 타입 크기 변경 10 -> 20
alter table dept7
modify column LOC varchar(20);
alter table dept7
-- 컬럼 삭제
drop column LOC;
select * from dept2;
-- 13
select count(*) from dept2;
-- 칼럼별로 데이터 추가
insert into dept2(DCODE, DNAME, PDEPT, AREA)
            values(9000, 'T1', 1006, 'TA');
-- 컬럼명 생략하고 데이터 추가
insert into dept2
            values(9001, 'T2', 1006, 'TA');
-- 모든 컬럼에 데이터를 넣을것이 아니면 컬럼명 생략하면 안됨
insert into dept2(DCODE, DNAME, PDEPT)
            values(9002, 'T3', 1006);
-- decimal : 숫자(소수점 포함) ex> decimal(3,2) 전체자리수:3 소수점 자리수:2
create table T_MINUS
(NO1 int
,NO2 decimal(3)
,NO3 decimal(3,2));
desc T_MINUS;
insert into T_MINUS values(1,1,1);
insert into T_MINUS values(1.1,1.1,1.1);
insert into T_MINUS values(-1.1,-1.1,-1.1);
insert into T_MINUS values(2.22,2.22,2.22);
insert into T_MINUS values(2.222,2.222,2.222);
insert into T_MINUS values(44,44,44); -- 오류
insert into T_MINUS values(44,44,4); 
insert into T_MINUS values(555,555,5); 
insert into T_MINUS values(5555,5555,5); -- 오류
insert into T_MINUS values(5555,555,5); 
select * from T_MINUS;
select * from professor
where position = 'assistant professor';
update professor
set bonus = 200
where position = 'assistant professor';
select * from dept2
where dcode >= 9000 and dcode <= 9999;
-- 데이터 삭제
delete from dept2
where dcode >= 9000 and dcode <= 9999;

select 987.654
     , round(987.654,2) -- 소수점 3번째자리에서 반올림
     , round(987.654,0) -- 소수점 첫번째자리에서 반올림
     , round(987.654,-1) -- 일의 자리에서 반올림
     , round(987.654,-2) -- 십의 자리에서 반올림
  from dual;
select mod(121,10) -- 나머지
     , ceil(123.45) -- 올림
     , floor(123.45) -- 내림
     , power(2,3) -- 승수(2의 3승)
     , now() -- 현재 날짜, 시간
  from dual;
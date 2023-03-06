-- mysql> show databases; ==> 데이터베이스 목록 조회
-- mysql> use green ===> green 데이터베이스 사용
-- mysql> show tables; ===> 테이블 목록 조회
-- mysql> source D:\export.sql ===> source 명령어로 sql 파일을 데이터베이스로 처리
-- green 데이터베이스에서 실행
-- emp 테이블 조회 (select 명령어: 테이블 조회, from + 테이블명: 대상 테이블 이름 지정, *: 모든컬럼(empno~deptno))
select * from emp;

-- 한줄 복사: ctrl + D, 한줄 삭제: ctrl + L
show databases;
show tables;
select * from dept;
-- desc : 테이블 구조 조회
-- Field : 컬럼명, type : 데이터 타입(int: 숫자, varchar(숫자): 문자(크기)) 
-- varchar(14) : 문자 크기가 14까지(0~14), 15는 안됨
-- Null : 필수값(NO: 필수, YES: 필수 아님)
-- Key - PRI (primary key) : 주요키 (필수값이면서 중복 안됨)
-- Default : 기본값(ex> 날짜일 때 오늘을 기본값으로 설정하면 오늘 날짜가 입력됨)
desc dept;
-- 조회 컬럼 8개
select * from emp;
-- 조회 컬럼 2개 (empno, ename)
select empno, ename from emp;
-- 사원명(ename) 조회
-- 'good mornig~~!' : 데이터는 아니지만 붙여서 출력
-- ename(컬럼명) : SMITH ~ MILLER(데이터)
-- '데이터' as "컬럼명" : 데이터자리에 들어갈 내용, 컬럼명 자리에 들어갈 내용
-- 명령어는 대소문자 구별없이 사용 가능(ex>select, as, from, 테이블명 등)
select ename, 'good mornig~~!' as "Good Morning" from emp;
-- emp(사원) 테이블 조회(사원번호, 사원명, 직책, 상관번호, 고용일자, 급여, 커미션, 부서번호)
select * from emp;
-- dept(부서) 테이블 조회(부서 번호 DEPNO, 부서명 DNAME, 위치 LOC)
select * from dept;
select dname, 'its deptno', DEPTNO from dept;
-- 내용에 ' 넣고 싶으면 아래처럼 두개 연속으로 쓸것
select dname, 'it''s deptno', DEPTNO from dept;
-- 부서번호 10~30
select DEPTNO from emp;
-- distinct : 중복 제거
select distinct DEPTNO from emp;
select JOB, ENAME from EMP;
-- JOB에서 중복되는 것이 있더라도 JOB ENAME 합쳐서 중복되는게 없으면 중복 제거 안됨
select distinct JOB, ENAME from EMP;
-- DISTINCT를 컬럼명 중간에 넣으면 오류
-- select JOB, distinct ENAME from EMP;

-- 연습문제
SHOW TABLES;
desc STUDENT;
select * FROM STUDENT;  
select studno, name, id from student;
select distinct deptno1 from student;
select name as "이름" , birthday as "생년월일" , height as "키(cm)", weight as "몸무게(kg)" from student;

-- 사원번호 : 7969~ 7934
select EMPNO, ENAME FROM EMP;
-- 사원번호가 7900인 데이터 조회
select EMPNO, ENAME FROM EMP where EMPNO=7900;
-- WHERE 조건절
select EMPNO
     , ENAME
  FROM emp
WHERE EMPNO = 7900;
-- SAL: 800~ 1300
select ENAME
     , SAL
  FROM emp
 WHERE SAL<1000;
select ENAME
     , SAL
  FROM emp
 where ENAME = 'SMITH';
 -- 소문자로 써도 조회됨 (오라클은 안됨)
select ENAME
     , SAL
  FROM emp
 where ENAME = 'smith';
-- 데이터 타입이 varchar(10)일 때'' 생략시 오류
 select ENAME
     , SAL
  FROM emp
 where ENAME = SMITH;
desc EMP;
-- 데이터타입이 int일 때는 '' 생략해도 정상적으로 동작
select ENAME
     , SAL
  FROM emp
 WHERE SAL<"1000";
-- 컬럼명 클릭시 데이터 정렬
select *
  FROM emp
 -- where HIREDATE = '1980-12-17';
 -- 데이터 타입 date에서 연도 앞의 두자리 숫자 생략 가능, and - 대신 / 사용 가능
 -- where HIREDATE = '80-12-17';
 -- where HIREDATE = '80/12/17';
 -- ''는 생략하면 오류 
 where HIREDATE = 80/12/17;
select ename
     , SAL
     , sal+100
     , SAL*1.1
  from emp;
  
  -- 연습문제
 select NAME
      , HEIGHT
      , WEIGHT
      , (height - weight)*0.9 as '표준 체중'
  from student;

select ename
     , SAL
  from emp
 WHERE SAL >= 4000;
-- 알파벳 순으로 s포함해서 z까지까지 출력
select ename
     , SAL
  from emp
 WHERE ENAME >= 'S';
-- 2000 <= SAL <=3000
select ename
     , SAL
  from emp
 WHERE SAL between 2000 AND 3000;
select ename
     , SAL
  from emp
 WHERE SAL >= 2000
   AND SAL <= 3000;
-- 알파벳 사전식 순으로 JAMES와 MARTIN 사이에 있는 ENAME 데이터값들
select ename
     , SAL
  from emp
 WHERE ENAME between 'JAMES' AND 'MARTIN';
 -- 10, 20번 부서 조회
select ename
     , SAL
     , DEPTNO
  from emp
 WHERE DEPTNO IN (10, 20);
 -- 1로 시작하는 SAL데이터
select ename
     , SAL
     , DEPTNO
  from emp
 WHERE SAL LIKE '1%';
 -- J로 시작하는 ENAME 데이터
select ename
     , SAL
     , DEPTNO
  from emp
 WHERE ENAME LIKE 'J%';
 -- 17로 끝나는 HIREDATE 데이터
select ename
     , SAL
     , HIREDATE
  from emp
 WHERE HIREDATE LIKE '%17'; 
-- COMM 값이 없는 데이터
select ename
     , SAL
     , COMM
  from emp
 WHERE COMM IS NULL;
 -- COMM 값이 있는 데이터
select ename
     , SAL
     , COMM
  from emp
 WHERE COMM IS NOT NULL;
-- HIREDATE 값이 '81/09/08'이후인 데이터
select ename
     , SAL
     , HIREDATE
  from emp
 WHERE HIREDATE > '81/09/08';
-- HIREDATE 값이 '81/09/08'이후이면서 SAL 값이 2000초과인 데이터
select ename
     , SAL
     , HIREDATE
  from emp
 WHERE HIREDATE > '81/09/08'
   AND SAL > 2000;
-- SAL값이 1000 초과 이면서 COMM값이 1000미만인 데이터
select ename
     , SAL
     , COMM
  from emp
 WHERE SAL > 1000
   -- AND COMM < 1000 OR COMM IS NULL;
   AND (COMM < 1000 OR COMM IS NULL);
-- ORDER BY ENAME : ENAME 정렬 -> ASC: 오름차순 (DEFAULT값, 생략가능), desc: 내림차순 
select ename
     , SAL
     , COMM
  from emp
 order by ENAME DESC;
 -- 같은 DEPTNO에서 SAL 오름차순 정렬
select ename
     , SAL
     , DEPTNO
  from emp
 order by DEPTNO, SAL;
  -- DEPTNO는 오름차순 SAL 내림차순 정렬
select ename
     , SAL
     , DEPTNO
  from emp
 order by DEPTNO, SAL DESC;
-- 위치값(2번컬럼)으로 오름차순 정렬
select ename
     , SAL
     , DEPTNO
  from emp
 order by 2;
-- 정렬기준 1쉰유: DEPTNO 오름차순, 2순위: SAL 내림차순
select ename
     , SAL
     , DEPTNO
  from emp
 order by 3, 2 DESC;
 
-- 4건
select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO1 = 101;
-- 2건
select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO2 = 201;
-- 5건 UNION : 합치면서 중복(JAMES SEO)제거
 select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO1 = 101
 UNION
select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO2 = 201;
 
 -- 6건 UNION ALL : 합치면서 중복(JAMES SEO)제거 안함
 select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO1 = 101
 UNION ALL
select NAME, DEPTNO1, DEPTNO2
  FROM STUDENT
 WHERE DEPTNO2 = 201;
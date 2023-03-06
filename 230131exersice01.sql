-- 연습문제
-- emp 구조
desc emp;
-- emp 모든 데이터 출력
select * from emp;
-- emp에서 사번, 이름 직업 출력
select empno
	 , ename
     , job
  from emp;
-- 부서번호 중복행 제외하고 출력
select distinct deptno from emp;
-- 칼럼명에 별명 붙여서 출력
select empno as '사번'
     , ename as '사원명'
     , job as '직업'
     , deptno as '부서번호' 
  from emp;
  -- 
select ename
     , JOB
     , sal
     , sal*12 as '연봉' 
  from emp;
 -- 
SELECT * FROM STUDENT;
select name
     , GRADE
     , HEIGHT
  FROM STUDENT
 WHERE HEIGHT >170
 order by HEIGHT DESC;
 --
select NAME, ID, GRADE FROM STUDENT
 WHERE DEPTNO1 = 101 AND GRADE >=3;
 -- 
select NAME, GRADE, HEIGHT FROM student
-- WHERE height >= 165 AND height <=175;
 WHERE HEIGHT BETWEEN 165 AND 175;
--
select NAME, ID, DEPTNO1 FROM STUDENT
 WHERE NAME like 'Bi%';
--
select * from professor;
desc professor;
select name, pay, deptno from professor
where bonus is null;
--
select profno, name, pay, bonus from professor
 order by pay desc;
--
select profno, name, pay, pay*12 as '연봉', deptno from professor
 order by deptno desc, pay*12;
--
select name, pay, bonus from professor
 where (pay >=300 and bonus is not null) or pay >=450;
--
select profno as 'no', name from professor
 where deptno = 201
 union
select studno, name from student
 where deptno1 = 201;
-- 
 select * from student;
select name, substr(jumin, 3, 4) as '생일' from student
 where deptno1 = 101;
--
Select name, TEL, instr(TEL, ')') from student
 where deptno1 = 201;
--
Select name, TEL, substr(TEL,1, INSTR(TEL, ')')-1 ) AS 'AREA CODE' from student
 where deptno1 = 201;
--
SELECT lpad(ENAME, 9, '123456789') AS 'LPAD' FROM EMP
WHERE DEPTNO = 10;
--
-- SELECT Rpad(ENAME, 9, (LENGTH(ENAME)+1)) AS 'RPAD' FROM EMP
SELECT Rpad(ENAME, 9, SUBSTR('123456789', LENGTH(ENAME)+1)) AS 'RPAD' FROM EMP
WHERE DEPTNO = 10;
-- 
select ENAME
     , REPLACE(ENAME, substr(ENAME, 2, 2), '--') AS 'REPLACE'
  FROM EMP
  WHERE DEPTNO = 20;
  --
SELECT * FROM STUDENT;
SELECT NAME
     , JUMIN
     , replace(JUMIN, SUBSTR(JUMIN,7,7),'-/-/-/-') 'REPLACE'
  FROM STUDENT
 WHERE DEPTNO1 = 101;
--
SELECT NAME
     , TEL
     , replace(TEL, SUBSTR(TEL,instr(TEL,')')+1,3),'***') 'REPLACE'
  FROM STUDENT
 WHERE DEPTNO1 = 102;
 
create TABLE new_emp
(no int
,name varchar(20)
,hiredate date
,bonus int);
desc new_emp;
--
create table new_emp15
as
select EMPNO, ENAME, substr(REPLACE(HIREDATE, '-', '/'),3) AS HIREDATE FROM emp;
create table new_emp2
as
select * FROM new_emp15;
select * FROM NEW_EMP2;
drop table new_emp15;
-- 
create table new_emp3
as
select * from new_emp2
where 1=2;
alter table new_emp3
add (BIRTHDAY date);
select * from new_emp3;
drop table new_emp3;
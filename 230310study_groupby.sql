use employees;

/*  group by
	group by절은 데이터들을 원하는 그룹으로 나눌 수 있따.
    나누고자 하는 그룹의 컬럼명을 select절과 group by절 뒤에 추가하면 된다.
    집계함수와 함께 사용되는 상수는 group by 절에 추가하지 않아도 된다.
*/

SHOW TABLES;

SELECT * FROM salaries
-- LIMIT 10; -- 처음부터 10개 
LIMIT 5, 10; -- 5번데이터부터 10개

-- 1단계 emp_no를 기준으로 그룹을 나눠 데이터 조회
-- group by에 조건절을 사용할 때는 having절을 사용한다.
SELECT * 
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10001;

-- 2단계 10001에 salary 갯수
SELECT *, count(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계 최대연봉 최소연봉 연봉 합계
SELECT *, count(salary) AS count, 
	max(salary) AS max, 
    min(salary) AS min,
    sum(salary) AS sum,
    round(avg(salary)) AS avg
FROM salaries
GROUP BY emp_no;


-- 1단계 조인
SELECT * 
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no;

-- 2단계 조인 하나 더
SELECT * 
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 3단계 필요한 컬럼만 뽑기
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계 
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';

-- 연습문제
-- 1. emp_no로 그룹을 나누고 title table에서 title과 salaries table에서 salary를 출력하라. (join 사용)
SELECT * 
FROM titles as t
LEFT JOIN salaries as s
ON t.emp_no = s.emp_no
GROUP BY salary;

SELECT * FROM titles;
SELECT * FROM salaries;
-- 2. 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라. (몇명인지도 출력)
SELECT *, count(salary) as '몇명'
FROM titles as t
LEFT JOIN salaries as s
ON t.emp_no = s.emp_no
GROUP BY salary
HAVING salary >=65000;
-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT *, max(salary) as '최고연봉'
FROM titles as t
LEFT JOIN salaries as s
ON t.emp_no = s.emp_no
GROUP BY salary
HAVING title LIKE '%Engineer';
-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT *, count(emp_no) as '몇명'
FROM dept_emp
GROUP BY dept_no ;
SELECT * FROM dept_emp;
-- 5. 각 직급 별로 몇 명이 있는지 출력해보자
SELECT *, count(emp_no) as '몇명'
FROM titles
GROUP BY title;
-- 6. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT *, max(salary) as '최고연봉'
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no
GROUP BY gender
HAVING gender = 'M';
-- 내문제. 1994-09-15 입사한 직원 남녀가 각각 몇명인지 구하시오.
SELECT *, count(*) as '몇명'
FROM employees
GROUP BY hire_date, gender
HAVING hire_date = '1994-09-15';
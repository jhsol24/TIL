-- 21.05.17
-- 5-3. 그룹함수 사용 실습

-- 사원의 입사일 중 가장 오래된 입사일, 가장 최근의 입사일 표시하세요.
SELECT MIN(hire_date),
       MAX(hire_date)
FROM   hr.employees;

-- 회사의 모든 사원수, 커미션을 지급받는 사원수 표시하세요.
SELECT COUNT(*) ALL_PERSONS,
       COUNT(commission_pct) COMM_PERSONS
FROM   hr.employees;
       -- COUNT(*) 함수에는 ALL/DISTINCT 키워드 사용 불가

-- 사원이 근무하고 있는 부서의 개수, 근무 부서가 지정된 사원의 수를 구하세요.
SELECT COUNT(DISTINCT department_id) DEPTS,
       COUNT(ALL department_id) DEPT_PERSONS
       FROM hr.employees;
       -- DEPARTMENT_ID IS NULL 인 행을 제외

-- 커미션 지급받는 사원들의 커미션 평균, 전체 사원을 대상으로 한 커미션 평균을 구하세요.
SELECT AVG(commission_pct) COMM_AVG_COMM_PERSONS,
       AVG(NVL(commission_pct, 0)) COMM_AVG_ALL_PERSONS
FROM   hr.employees;


-- 5-6. HAVING 절 사용 실습

-- JOB_ID 컬럼의 값에 REP 가 포함된 행들의 부서번호, 급여를 부서번호 순으로 출력하세요.
SELECT   department_id, SALARY
FROM     HR.EMPLOYEE
WHERE    JOB_ID LIKE '%REP%'
ORDER BY 1;

-- JOB_ID 에 REP 가 포함된 사원에 대해서만 부서별 급여의 합계, 부서별 평균 급여,
-- 부서별 근무 인원수를 구하세요.
SELECT   department_id, SUM(salary), AVG(salary), count(*)
FROM     hr.employees
WHERE    job_id LIKE '%REP%'
GROUP BY department_id
HAVING   SUM(salary) > 7000
ORDER BY 2;


-- 5-7. GROUP 함수 중첩

-- 부서별 임금의 합계 금액 중에서, 가장 큰 부서별 합계임금 값을 표시하세요.
SELECT   MAX(SUM(salary)) AS RESULT
FROM     hr.employees
GROUP BY department_id;

-- 입사일을 이용하여 1) 연도별 입사인원 2) 연도, 월별 입사인원을 표시하세요.
-- 1)
SELECT   TO_CHAR(hire_date, 'YYYY') AS HIRE_YEAR, COUNT(*) AS PERSONS
FROM     hr.employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

-- 2)
SELECT   TO_CHAR(hire_date, 'YYYYMM') AS HIRE_YEAR_MONTH, COUNT(*) AS PERSONS
FROM     hr.employees
GROUP BY TO_CHAR(hire_date, 'YYYYMM')
ORDER BY 1;


-- 6-2. EQUI-INNER JOIN
-- EMPLOYEE, DEPARTMENTS 테이블로부터 사원의 사번, 성과 사원이 근무하는 부서의 부서코드,
-- 부서이름을 모든 사원에 대하여 표시하세요.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM   HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D
ON     (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY 3;

-- 6-5. 3-Way Join
-- HR.EMPLOYEES 테이블, HR.DEPARTMENTS 테이블, 및 HR.LOCATIONS 테이블로부터,
-- 사번이 100,150,200 인 사원의 성(EMPLOYEES.LAST_NAME 컬럼)과 
-- 그 사원이 출근하는 부서가 있는 도시이름(LOCATIONS.CITY 컬럼)을 표시하시오.
SELECT e.last_name, l.city
FROM   hr.employees e 
JOIN   hr.departments d ON (e.department_id = d.department_id)
JOIN   hr.locations l ON (d.location_id = l.location_id)
WHERE  e.employee_id IN (100, 150, 200);

-- 6-6. EQUI-INNER JOIN USING 'USING'
-- HR.EMPLOYEES 테이블과 HR.DEPARTMENTS 테이블로부터, 사원의 사번, 성과 사원이 근무하는
-- 부서의 부서코드, 부서이름을 모든 사원에 대하여 표시하시오.
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM   hr.employees e INNER JOIN departments d
USING (department_id);






















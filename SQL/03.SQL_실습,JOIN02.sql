-- 문제 해결을 위한 테이블 생성
CREATE TABLE hr.job_grades (
grade_level VARCHAR(2) PRIMARY KEY,
lowest_sal  NUMBER(10),
highest_sal NUMBER(10) );

-- 테이블에 정보(자료) 입력
INSERT INTO hr.job_grades VALUES ('A', 1000, 2999);
INSERT INTO hr.job_grades VALUES ('B', 3000, 5999);
INSERT INTO hr.job_grades VALUES ('C', 6000, 9999);
INSERT INTO hr.job_grades VALUES ('D', 10000, 14999);
INSERT INTO hr.job_grades VALUES ('E', 15000, 24999);
INSERT INTO hr.job_grades VALUES ('F', 25000, 40000);
COMMIT;

-- 현재 날짜 출력
SELECT sysdate FROM dual;

-- 날짜 조건 다루기
SELECT * FROM hr.employees
WHERE hire_date >= TO_DATE('2008/01/01', 'YYYY/MM/DD');

--------------------------------------------------------------------------------

-- 05.19
-- HR.EMPLOYEES 테이블, HR.DEPARTMENTS 테이블, 및 HR.LOCATIONS 테이블로부터, 사번이 
-- 100,150,200 인 사원의 성(EMPLOYEES.LAST_NAME 컬럼)과 
-- 그 사원이 출근하는 부서가 있는 도시이름(LOCATIONS.CITY 컬럼)을 표시하시오.

SELECT e.last_name, l.city
FROM   hr.employees e
JOIN   hr.departments d USING (department_id)
JOIN   hr.locations l USING  (location_id)
WHERE  e.employee_id IN (100, 150, 200);

-- 6-7. NON-EQUI-INNER-JOIN
-- HR.EMPLOYEES 테이블과 HR.JOB_GRADES 테이블로부터, 모든 사원에 대하여 사원의 성
-- (EMPLOYEES.LAST_NAME 컬럼)과 사원의 급여(EMPLOYEES.SALARY 컬럼) 및 
-- 해당 급여에 대한 등급(JOB_GRADES.GRADE_LEVEL 컬럼)을 표시하시오.
SELECT e.last_name, e.salary, j.grade_level
FROM   hr.employees e
INNER JOIN hr.job_grades j ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);
-- JOIN 조건에서 BETWEEN AND 연산자 사용

-- 6-8. OUTER JOIN
-- HR.EMPLOYEES 테이블과 HR.DEPARTMENTS 테이블로부터 사원의 사번, 사원의 성과 사원이 
-- 근무하는 부서의 부서코드 및 부서이름을 모든 사원에 대하여 표시하시오. 
-- 단, 근무부서가 지정되지 않은 사원에 대한 정보도 표시되어야합니다.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM   hr.employees e
LEFT OUTER JOIN hr.departments d
ON (e.department_id = d.department_id);
-- 근무 부서가 지정되지 않은 모든 사원의 정보를 표시하므로 employees 를 기준으로
-- OUTER JOIN 적용


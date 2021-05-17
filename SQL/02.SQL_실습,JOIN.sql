-- 테이블 생성
CREATE TABLE HR.JOB_GRADES (
GRADE_LEVEL VARCHAR(2) PRIMARY KEY,
LOWEST_SAL  NUMBER(10),
HIGHEST_SAL NUMBER(10) );

-- 테이블에 정보(자료) 입력
INSERT INTO HR.JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO HR.JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO HR.JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO HR.JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO HR.JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO HR.JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;

-- 현재 날짜 출력
SELECT SYSDATE FROM DUAL;

-- 날짜 조건 다루기
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2008/01/01', 'YYYY/MM/DD');


--------------------------------------------------------------------------------
-- 21.05.17
-- 5-3. 그룹함수 사용 실습

-- 사원의 입사일 중 가장 오래된 입사일, 가장 최근의 입사일 표시하세요.
SELECT MIN(HIRE_DATE),
       MAX(HIRE_DATE)
       FROM HR.EMPLOYEES;

-- 회사의 모든 사원수, 커미션을 지급받는 사원수 표시하세요.
SELECT COUNT(*) ALL_PERSONS,
       COUNT(COMMISSION_PCT) COMM_PERSONS
       FROM HR.EMPLOYEES;
       -- COUNT(*) 함수에는 ALL/DISTINCT 키워드 사용 불가

-- 사원이 근무하고 있는 부서의 개수, 근무 부서가 지정된 사원의 수를 구하세요.
SELECT COUNT(DISTINCT DEPARTMENT_ID) DEPTS,
       COUNT(ALL DEPARTMENT_ID) DEPT_PERSONS
       FROM HR.EMPLOYEES;
       -- DEPARTMENT_ID IS NULL 인 행을 제외

-- 커미션 지급받는 사원들의 커미션 평균, 전체 사원을 대상으로 한 커미션 평균을 구하세요.
SELECT AVG(COMMISSION_PCT) COMM_AVG_COMM_PERSONS,
       AVG(NVL(COMMISSION_PCT, 0)) COMM_AVG_ALL_PERSONS
       FROM HR.EMPLOYEES;


-- 5-6. HAVING 절 사용 실습

-- JOB_ID 컬럼의 값에 REP 가 포함된 행들의 부서번호, 급여를 부서번호 순으로 출력하세요.
SELECT DEPARTMENT_ID, SALARY
FROM   HR.EMPLOYEE
WHERE  JOB_ID LIKE '%REP%'
ORDER BY 1;

-- JOB_ID 에 REP 가 포함된 사원에 대해서만 부서별 급여의 합계, 부서별 평균 급여,








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




























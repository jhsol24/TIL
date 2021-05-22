-- 6-8. OUTER JOIN
-- HR.EMPLOYEES 테이블과 HR.DEPARTMENTS 테이블로부터 사원의 사번, 사원의 성과 사원이 
-- 근무하는 부서의 부서코드 및 부서이름을 모든 사원에 대하여 표시하시오. 
-- 단, 근무부서가 지정되지 않은 사원에 대한 정보도 표시하며,
-- 근무하는 사원이 없는 부서의 부서코드 및 부서이름도 결과에 표시되도록 합니다.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM   hr.employees e
FULL OUTER JOIN hr.departments d
ON    (e.department_id = d.department_id);

-- 6-9 JOIN 시에 추가 조건 적용
-- EMPLOYEES 및 DEPARTMENTS 테이블을 이용하여, 90번 부서에 근무하는 사원의 성과 
-- 근무하는 부서이름을 표시하시오.
-- 1) 추가 조건을 AND 사용하여 적용
SELECT e.last_name, d.department_name
FROM   hr.employees e
JOIN   hr.departments d
ON     (e.department_id = d.department_id)
AND    e.department_id = 90;

-- 2) 추가 조건을 WHERE 사용하여 적용
SELECT e.last_name, d.department_name
FROM   hr.employees e
JOIN   hr.departments d
ON     (e.department_id = d.department_id)
WHERE  e.department_id = 90;

-- 6-10. CROSS JOIN
-- EMPLOYEES 및 DEPARTMENTS 테이블 테이블로부터, 90번 부서에 근무하는 사원의 사번,
-- 사원의 성과 사원이 근무하는 부서의 부서코드를 표시하되 표시되는 각 레코드마다 
-- 10번 부서의 부서코드 및 부서이름이 같이 표시되도록 하시오.
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_id, d.department_name
FROM   hr.employees e
CROSS JOIN hr.departments d
WHERE  e.department_id = 90 AND d.department_id = 10;
-- 잘못된 CROSS JOIN 사용
-- WHERE절 없이 CROSS JOIN을 사용하면, EMPLOYEES 테이블의 각 행들이 
-- DEPARTMENTS 테이블의 모든 행들과 조인됨
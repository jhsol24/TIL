-- 21.05.17
-- 5-3. �׷��Լ� ��� �ǽ�

-- ����� �Ի��� �� ���� ������ �Ի���, ���� �ֱ��� �Ի��� ǥ���ϼ���.
SELECT MIN(hire_date),
       MAX(hire_date)
FROM   hr.employees;

-- ȸ���� ��� �����, Ŀ�̼��� ���޹޴� ����� ǥ���ϼ���.
SELECT COUNT(*) ALL_PERSONS,
       COUNT(commission_pct) COMM_PERSONS
FROM   hr.employees;
       -- COUNT(*) �Լ����� ALL/DISTINCT Ű���� ��� �Ұ�

-- ����� �ٹ��ϰ� �ִ� �μ��� ����, �ٹ� �μ��� ������ ����� ���� ���ϼ���.
SELECT COUNT(DISTINCT department_id) DEPTS,
       COUNT(ALL department_id) DEPT_PERSONS
       FROM hr.employees;
       -- DEPARTMENT_ID IS NULL �� ���� ����

-- Ŀ�̼� ���޹޴� ������� Ŀ�̼� ���, ��ü ����� ������� �� Ŀ�̼� ����� ���ϼ���.
SELECT AVG(commission_pct) COMM_AVG_COMM_PERSONS,
       AVG(NVL(commission_pct, 0)) COMM_AVG_ALL_PERSONS
FROM   hr.employees;


-- 5-6. HAVING �� ��� �ǽ�

-- JOB_ID �÷��� ���� REP �� ���Ե� ����� �μ���ȣ, �޿��� �μ���ȣ ������ ����ϼ���.
SELECT   department_id, SALARY
FROM     HR.EMPLOYEE
WHERE    JOB_ID LIKE '%REP%'
ORDER BY 1;

-- JOB_ID �� REP �� ���Ե� ����� ���ؼ��� �μ��� �޿��� �հ�, �μ��� ��� �޿�,
-- �μ��� �ٹ� �ο����� ���ϼ���.
SELECT   department_id, SUM(salary), AVG(salary), count(*)
FROM     hr.employees
WHERE    job_id LIKE '%REP%'
GROUP BY department_id
HAVING   SUM(salary) > 7000
ORDER BY 2;


-- 5-7. GROUP �Լ� ��ø

-- �μ��� �ӱ��� �հ� �ݾ� �߿���, ���� ū �μ��� �հ��ӱ� ���� ǥ���ϼ���.
SELECT   MAX(SUM(salary)) AS RESULT
FROM     hr.employees
GROUP BY department_id;

-- �Ի����� �̿��Ͽ� 1) ������ �Ի��ο� 2) ����, ���� �Ի��ο��� ǥ���ϼ���.
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
-- EMPLOYEE, DEPARTMENTS ���̺�κ��� ����� ���, ���� ����� �ٹ��ϴ� �μ��� �μ��ڵ�,
-- �μ��̸��� ��� ����� ���Ͽ� ǥ���ϼ���.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM   HR.EMPLOYEES E INNER JOIN HR.DEPARTMENTS D
ON     (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY 3;

-- 6-5. 3-Way Join
-- HR.EMPLOYEES ���̺�, HR.DEPARTMENTS ���̺�, �� HR.LOCATIONS ���̺�κ���,
-- ����� 100,150,200 �� ����� ��(EMPLOYEES.LAST_NAME �÷�)�� 
-- �� ����� ����ϴ� �μ��� �ִ� �����̸�(LOCATIONS.CITY �÷�)�� ǥ���Ͻÿ�.
SELECT e.last_name, l.city
FROM   hr.employees e 
JOIN   hr.departments d ON (e.department_id = d.department_id)
JOIN   hr.locations l ON (d.location_id = l.location_id)
WHERE  e.employee_id IN (100, 150, 200);

-- 6-6. EQUI-INNER JOIN USING 'USING'
-- HR.EMPLOYEES ���̺�� HR.DEPARTMENTS ���̺�κ���, ����� ���, ���� ����� �ٹ��ϴ�
-- �μ��� �μ��ڵ�, �μ��̸��� ��� ����� ���Ͽ� ǥ���Ͻÿ�.
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM   hr.employees e INNER JOIN departments d
USING (department_id);






















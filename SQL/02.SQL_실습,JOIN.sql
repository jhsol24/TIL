-- ���̺� ����
CREATE TABLE HR.JOB_GRADES (
GRADE_LEVEL VARCHAR(2) PRIMARY KEY,
LOWEST_SAL  NUMBER(10),
HIGHEST_SAL NUMBER(10) );

-- ���̺� ����(�ڷ�) �Է�
INSERT INTO HR.JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO HR.JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO HR.JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO HR.JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO HR.JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO HR.JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;

-- ���� ��¥ ���
SELECT SYSDATE FROM DUAL;

-- ��¥ ���� �ٷ��
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2008/01/01', 'YYYY/MM/DD');


--------------------------------------------------------------------------------
-- 21.05.17
-- 5-3. �׷��Լ� ��� �ǽ�

-- ����� �Ի��� �� ���� ������ �Ի���, ���� �ֱ��� �Ի��� ǥ���ϼ���.
SELECT MIN(HIRE_DATE),
       MAX(HIRE_DATE)
       FROM HR.EMPLOYEES;

-- ȸ���� ��� �����, Ŀ�̼��� ���޹޴� ����� ǥ���ϼ���.
SELECT COUNT(*) ALL_PERSONS,
       COUNT(COMMISSION_PCT) COMM_PERSONS
       FROM HR.EMPLOYEES;
       -- COUNT(*) �Լ����� ALL/DISTINCT Ű���� ��� �Ұ�

-- ����� �ٹ��ϰ� �ִ� �μ��� ����, �ٹ� �μ��� ������ ����� ���� ���ϼ���.
SELECT COUNT(DISTINCT DEPARTMENT_ID) DEPTS,
       COUNT(ALL DEPARTMENT_ID) DEPT_PERSONS
       FROM HR.EMPLOYEES;
       -- DEPARTMENT_ID IS NULL �� ���� ����

-- Ŀ�̼� ���޹޴� ������� Ŀ�̼� ���, ��ü ����� ������� �� Ŀ�̼� ����� ���ϼ���.
SELECT AVG(COMMISSION_PCT) COMM_AVG_COMM_PERSONS,
       AVG(NVL(COMMISSION_PCT, 0)) COMM_AVG_ALL_PERSONS
       FROM HR.EMPLOYEES;


-- 5-6. HAVING �� ��� �ǽ�

-- JOB_ID �÷��� ���� REP �� ���Ե� ����� �μ���ȣ, �޿��� �μ���ȣ ������ ����ϼ���.
SELECT DEPARTMENT_ID, SALARY
FROM   HR.EMPLOYEE
WHERE  JOB_ID LIKE '%REP%'
ORDER BY 1;

-- JOB_ID �� REP �� ���Ե� ����� ���ؼ��� �μ��� �޿��� �հ�, �μ��� ��� �޿�,








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




























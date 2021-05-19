-- ���� �ذ��� ���� ���̺� ����
CREATE TABLE hr.job_grades (
grade_level VARCHAR(2) PRIMARY KEY,
lowest_sal  NUMBER(10),
highest_sal NUMBER(10) );

-- ���̺� ����(�ڷ�) �Է�
INSERT INTO hr.job_grades VALUES ('A', 1000, 2999);
INSERT INTO hr.job_grades VALUES ('B', 3000, 5999);
INSERT INTO hr.job_grades VALUES ('C', 6000, 9999);
INSERT INTO hr.job_grades VALUES ('D', 10000, 14999);
INSERT INTO hr.job_grades VALUES ('E', 15000, 24999);
INSERT INTO hr.job_grades VALUES ('F', 25000, 40000);
COMMIT;

-- ���� ��¥ ���
SELECT sysdate FROM dual;

-- ��¥ ���� �ٷ��
SELECT * FROM hr.employees
WHERE hire_date >= TO_DATE('2008/01/01', 'YYYY/MM/DD');

--------------------------------------------------------------------------------

-- 05.19
-- HR.EMPLOYEES ���̺�, HR.DEPARTMENTS ���̺�, �� HR.LOCATIONS ���̺�κ���, ����� 
-- 100,150,200 �� ����� ��(EMPLOYEES.LAST_NAME �÷�)�� 
-- �� ����� ����ϴ� �μ��� �ִ� �����̸�(LOCATIONS.CITY �÷�)�� ǥ���Ͻÿ�.

SELECT e.last_name, l.city
FROM   hr.employees e
JOIN   hr.departments d USING (department_id)
JOIN   hr.locations l USING  (location_id)
WHERE  e.employee_id IN (100, 150, 200);

-- 6-7. NON-EQUI-INNER-JOIN
-- HR.EMPLOYEES ���̺�� HR.JOB_GRADES ���̺�κ���, ��� ����� ���Ͽ� ����� ��
-- (EMPLOYEES.LAST_NAME �÷�)�� ����� �޿�(EMPLOYEES.SALARY �÷�) �� 
-- �ش� �޿��� ���� ���(JOB_GRADES.GRADE_LEVEL �÷�)�� ǥ���Ͻÿ�.
SELECT e.last_name, e.salary, j.grade_level
FROM   hr.employees e
INNER JOIN hr.job_grades j ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);
-- JOIN ���ǿ��� BETWEEN AND ������ ���

-- 6-8. OUTER JOIN
-- HR.EMPLOYEES ���̺�� HR.DEPARTMENTS ���̺�κ��� ����� ���, ����� ���� ����� 
-- �ٹ��ϴ� �μ��� �μ��ڵ� �� �μ��̸��� ��� ����� ���Ͽ� ǥ���Ͻÿ�. 
-- ��, �ٹ��μ��� �������� ���� ����� ���� ������ ǥ�õǾ���մϴ�.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM   hr.employees e
LEFT OUTER JOIN hr.departments d
ON (e.department_id = d.department_id);
-- �ٹ� �μ��� �������� ���� ��� ����� ������ ǥ���ϹǷ� employees �� ��������
-- OUTER JOIN ����


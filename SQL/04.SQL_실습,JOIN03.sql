-- 6-8. OUTER JOIN
-- HR.EMPLOYEES ���̺�� HR.DEPARTMENTS ���̺�κ��� ����� ���, ����� ���� ����� 
-- �ٹ��ϴ� �μ��� �μ��ڵ� �� �μ��̸��� ��� ����� ���Ͽ� ǥ���Ͻÿ�. 
-- ��, �ٹ��μ��� �������� ���� ����� ���� ������ ǥ���ϸ�,
-- �ٹ��ϴ� ����� ���� �μ��� �μ��ڵ� �� �μ��̸��� ����� ǥ�õǵ��� �մϴ�.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM   hr.employees e
FULL OUTER JOIN hr.departments d
ON    (e.department_id = d.department_id);

-- 6-9 JOIN �ÿ� �߰� ���� ����
-- EMPLOYEES �� DEPARTMENTS ���̺��� �̿��Ͽ�, 90�� �μ��� �ٹ��ϴ� ����� ���� 
-- �ٹ��ϴ� �μ��̸��� ǥ���Ͻÿ�.
-- 1) �߰� ������ AND ����Ͽ� ����
SELECT e.last_name, d.department_name
FROM   hr.employees e
JOIN   hr.departments d
ON     (e.department_id = d.department_id)
AND    e.department_id = 90;

-- 2) �߰� ������ WHERE ����Ͽ� ����
SELECT e.last_name, d.department_name
FROM   hr.employees e
JOIN   hr.departments d
ON     (e.department_id = d.department_id)
WHERE  e.department_id = 90;

-- 6-10. CROSS JOIN
-- EMPLOYEES �� DEPARTMENTS ���̺� ���̺�κ���, 90�� �μ��� �ٹ��ϴ� ����� ���,
-- ����� ���� ����� �ٹ��ϴ� �μ��� �μ��ڵ带 ǥ���ϵ� ǥ�õǴ� �� ���ڵ帶�� 
-- 10�� �μ��� �μ��ڵ� �� �μ��̸��� ���� ǥ�õǵ��� �Ͻÿ�.
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_id, d.department_name
FROM   hr.employees e
CROSS JOIN hr.departments d
WHERE  e.department_id = 90 AND d.department_id = 10;
-- �߸��� CROSS JOIN ���
-- WHERE�� ���� CROSS JOIN�� ����ϸ�, EMPLOYEES ���̺��� �� ����� 
-- DEPARTMENTS ���̺��� ��� ���� ���ε�
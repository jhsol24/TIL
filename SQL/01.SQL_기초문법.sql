-- Create table
CREATE TABLE myUser01.TBL_MEMBERS ( --�⺻���� �÷��̸� ����������() �� �޸��� �����ؼ� ���
  mid VARCHAR2(100),
  mpw VARCHAR2(1000),
  mname VARCHAR2(30),
  mtel VARCHAR2(11),
  maddr VARCHAR2(500),
  memail VARCHAR2(100),  --VARCHAR2 ������ �������� ���� ������ ��
  mbirth DATE,           --��¥(DATE���������� ��¥�ð����� ó���� �� ����)
  mlevel CHAR(1)         --CHAR ������ ������ ���ڱ����� ��
)TABLESPACE myData01;

CREATE TABLE myProduct (
pid VARCHAR2(30),
pname VARCHAR(100),
pqty NUMBER(5,0)
)TABLESPACE myData01 ;



-- Insert data
INSERT INTO myUser01.TBL_members
VALUES ('apple01', '12345',
        '����', '01012348765',
        '����Ư���� ���α�',
         'apple01@goott.com',
            TO_DATE('1982/03/05', 'YYYY/MM/DD'),
            'A' );
commit ;


INSERT INTO myUser01.TBL_members
VALUES ('apple02', '12345',
        '����', '01012348765',
        '����Ư���� ���α�',
         'apple02@goott.com',
            TO_DATE('1988/03/05', 'YYYY/MM/DD'),
            'A' );
COMMIT ;


-- Update data
UPDATE myUser01.TBL_members
SET mtel = '01112345678',
      mname= '������'
WHERE mid = 'apple01' ;

Commit ;


-- Delete data
DELETE FROM myUser01.TBL_members
WHERE mid = 'apple02' ;
commit ;


-- Select data
SELECT mid, mname, mtel 
FROM myUser01.TBL_members 
WHERE mid = 'apple01' ;

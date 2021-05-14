-- Create table
CREATE TABLE myUser01.TBL_MEMBERS ( --기본형식 컬럼이름 데이터유형() 을 콤마로 구분해서 기술
  mid VARCHAR2(100),
  mpw VARCHAR2(1000),
  mname VARCHAR2(30),
  mtel VARCHAR2(11),
  maddr VARCHAR2(500),
  memail VARCHAR2(100),  --VARCHAR2 유형은 가변길이 문자 데이터 값
  mbirth DATE,           --날짜(DATE내부적으로 날짜시간값을 처리할 수 있음)
  mlevel CHAR(1)         --CHAR 유형은 고정된 문자길이의 값
)TABLESPACE myData01;

CREATE TABLE myProduct (
pid VARCHAR2(30),
pname VARCHAR(100),
pqty NUMBER(5,0)
)TABLESPACE myData01 ;



-- Insert data
INSERT INTO myUser01.TBL_members
VALUES ('apple01', '12345',
        '애플', '01012348765',
        '서울특별시 구로구',
         'apple01@goott.com',
            TO_DATE('1982/03/05', 'YYYY/MM/DD'),
            'A' );
commit ;


INSERT INTO myUser01.TBL_members
VALUES ('apple02', '12345',
        '애플', '01012348765',
        '서울특별시 구로구',
         'apple02@goott.com',
            TO_DATE('1988/03/05', 'YYYY/MM/DD'),
            'A' );
COMMIT ;


-- Update data
UPDATE myUser01.TBL_members
SET mtel = '01112345678',
      mname= '오렌지'
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

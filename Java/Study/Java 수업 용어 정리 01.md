 ## Java 수업 용어정리 01

### 1. MyBatis

**Java object와 SQL문 사이의 자동 Mapping 기능을 지원하는 Framework**

- MyBatis의 특징
  1. 쉬운 접근성과 코드의 간결함
  2. SQL문과 프로그래밍 코드의 분리
  3. 다양한 프로그래밍 언어로 구현 가능



### 2. JDBC (Java Database Connectivity)

**Java에서 DB Programming을 하기 위해 사용되는 API**

1. java.sql Package

   java.sql 패키지를 import 해서 사용한다.

   1-1. java.sql.Driver

   - DB와 연결하는 Driver class 를 만들 때 실행해야 하는 interface 로 JDBC 드라이버의 중심이 되는 interface

   1-2. java.sql.Connection

   - DriverManager 로부터 Connection 객체를 가져옴

   1-3. java.sql.Statement

   - SQL query 문을 DB에 전송하는 방법을 정의
   - Connection 을 통해 가져옴

   1-4. java.sql.ResultSet

   - SELECT 구문 실행 결과를 조회할 수 있는 방법을 정의

   1-5. Jjava.sql.PrepareStatement

   - Statement 의 하위 interface
   - SQL 문을 미리 컴파일하여 실행 속도를 높임

2. JDBC 개발 단계

   2-1. JDBC Driver loading

   2-2. Connection

   2-3. Statement / PreparedStatement

   2-4. executeUpdate() or executeQuery()

   2-5. ResultSet (SELECT 의 경우)

   2-6. close (Connection, Statement, Resultset)



### 3. Java Class 종류

1. VO (Value Object)

   - 간단한 독칩체(Entity)를 의미

   - 단점 : 클래스 선언을 위해 많은 코드가 필요하다. 파일 수가 많아진다.

2. DAO (Data Access Object : 데이터 접근 객체)
   - 데이터 접근을 목적하는 객체
   - DB에 대한 INSERT, UPDATE, SELECT를 처리한다.
   - DB 접근을 위한 로직과 비즈니스 로직을 분리하기 위해 사용



### 4. CRUD

- CREATE, READ(SELECT), UPDATE, DELETE



### 5. JSP (Java Server Pages)

**HTML 코드에 JAVA 코드를 넣어 동적 웹페이지를 생성하는 웹어플리케이션 도구**

- 실행되면 Servlet으로 변환되며 WAS에서 동작되면서 필요한 기능을 수행하고 생성된 데이터를 웹페이지와 함께 클라이언트로 응답한다.




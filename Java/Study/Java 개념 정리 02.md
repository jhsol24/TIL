## Java 수업 용어정리 02

### 1. GET, POST 방식 차이

0. HTTP
   - 웹 상에서 클라이언트와 서버 간에 데이터를 주고 받을 수 있는 프로토콜
   - GET, POST 두 가지 방식이 있다.

1. GET
   - 데이터가 노출되어 보안에 취약
   - 캐싱하여 페이지 로딩 속도를 높일 때 사용
   - key, value 사용
   - 글자수, 용량 제한

2. POST
   - 보안적으로 안전
   - 민감 데이터는 암호화를 해줘야 한다.
   - key, value 사용
   - 대용량 데이터 전송 가능



### 2. MVC 패턴

**Model, View, Controller 의 약자.**
**하나의 애플리케이션, 프로젝트를 구성할 때의 구성요소를 구분한 디자인 패턴**

![img](https://mblogthumb-phinf.pstatic.net/MjAxNzAzMjVfMTM0/MDAxNDkwNDQyNDI5OTAy.MUksll6Y9SzelJjmGW6zXOlPebJKOft3OhcnmhrcmTgg.4g4FxlhwEpgxp8kGXJVLf2LHlrRJhP7NqR7LJew8tL0g.PNG.jhc9639/ModelViewControllerDiagram.png?type=w800)

1. Model

   애플리케이션의 정보, 데이터를 표시. 데이터 정보의 가공을 책임지는 컴포넌트

   - 규칙
     - 사용자가 편집하길 원하는 모든 데이터를 가지고 있어야한다.
     - View, Controller 에 대해서 어떤 정보도 알지 말아야 한다.
     - 변경이 일어나면, 변경 통지에 대한 처리방법을 구현해야 한다.

2. View

   input 텍스트, 체크박스 항목 등과 같은 사용자 인터페이스 요소.

   데이터 및 객체의 입력, 출력을 담당. 사용자들이 볼 수 있는 화면.

   - 규칙
     - 모델이 가지고 있는 정보를 따로 저장해서는 안된다.
     - 다른 구성요소들을 몰라야 한다. View 가 할 수 있는 역할만 독립적으로 해야 한다.
     - 변경이 일어나면 변경 통지에 대한 처리방법을 구현해야 한다.

3. Controller

   데이터와 사용자 인터페이스 요소들을 잇는 다리 역할.

   데이터를 클릭하고, 수정하는 것에 대한 이벤트를 처리.

   - 규칙
     - 모델이나 뷰에 대해 알고 있어야 한다.
     - 모델이나 뷰의 변경을 모니터링 해야 한다.



### 3. Map

Java 자료형 중 하나로 Associative array, Hash 라고도 한다.
**대응 관계를 쉽게 표현해주는 자료형이다.**
Map 자료형 종류로는 HashMap, LinkedHash Map, TreeMap 이 있다.
가장 많이 쓰이는 메소드로는 put(), get(), remove()

- 이 후 자세한 추가 공부 필요



### 4. List

**Java 에서 List 컬렉션의 종류로는 ArrayList, Vector, LinkedList 가 있다.**
ArrayList 가 가장 많이 사용되고, Queue 자료구조를 사용할 때 LinkedList 를 사용한다.
**List 컬렉션 인터페이스에는 객체를 추가(add), 검색(contain, get, size), 삭제(remove, clear) 기능의 메서드가 선언되어 있다.**
그러므로 이를 상속해서 구현하는 클래스는 해당 기능을 오버라이드 해야한다.

- **ArrayList 객체를 생성해서 객체를 추가, 검색, 삭제하는 과정을 보여주는 예제 코드**

```java
//String 객체를 관리하는 ArrayList 생성
List<String> list = new ArrayList();

//String 객체 저장
list.add("Hello World");

//null 저장
list.add(null);

//동일한 String 객체를 갖고 있는지 검색
boolean isFindValue = list.contains("Hello World");

//인덱스 값을 이용하여 객체 삭제
list.remove(0);

//List에 저장된 모든 객체를 얻어서 콘솔 창에 출력
for (String value : list) {
    System.out.print(value)
}
```

#### 1) ArrayList

Java 에서 기본적으로 많이 사용되는 클래스.

1. 생성

   ArrayList를 사용하려면 먼저 ArrayList 객체를 만들어야 한다.

   ```java
   import java.util.ArrayList;		//import를 하고 사용한다.
   import java.util.Iteratior;		//이후 반복문을 위한 import
   
   public class Main {
       public static void main(String[] args) {
           ArrayList<Integer> numbers = new ArrayList<>(); //numbers 리스트 생성
       }
   }
   ```

2. 추가/ 삭제/ 가져오기

   ```java
   //추가
   numbers.add(10);
   numbers.add(20);
   numbers.add(30);
   numbers.add(40);
   
   numbers.add(1, 50);		//index 1에 50이라는 element를 추가
   
   //삭제
   numbers.remove(2);		//index 2의 element를 제거
   
   //가져오기
   numbers.get(2); 	//index 2의 element를 가져옴
   ```

3. 반복

   ```java
   //Iterator 객체 생성
   Iterator it<Integer> = numbers.iterator();
   
   //while문으로 반복하여 요소를 호출
   //다음 값이 존재하는지에 대한 boolean 값을 호출하는 hasNext() 사용
   while (it.hasNext()) {
       System.out.println(it.next());
   }
   
   //for문으로 반복하여 요소를 호출 (1)
   for (int value : numbers) {
       System.out.println(value);
   }
   
   //for문으로 반복하여 요소를 호출 (2)
   for (int i=0; i<numbers.size(); i++) {
       System.out.println(numbers.get(i));
   }
   ```

   

#### 2) Vector

#### 3) LinkedList



### 5. 접근제어자 (Access Modifier : public, private, protected )

Class, Method, field 에 붙을 수 있다. 각각의 의미 차이를 알아야 한다.

1. class

   - public class

     모든 package 에서 해당 class 로 접근 가능

   - private class

     자신을 포함한 package 에서만 해당 class 로 접근 가능

   - protected class

     상속받은 class 에서만 해당 class 로 접근 가능

2. method

   - public method

     모든 class 에서 해당 method로 접근 가능

   - private method

     자신을 포함한 class 에서만 해당 method로 접근 가능

   - protected method

     상속받은 class 와 자신이 속한 class 에서만 접근 가능


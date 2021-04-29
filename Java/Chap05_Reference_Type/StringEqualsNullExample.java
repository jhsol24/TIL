package sec01;

public class StringEqualsNullExample {
	public static void main(String[] args) {
	      
      String nullStr = null ;
      System.out.println("nullStr메모리어드레스: " + System.identityHashCode(nullStr));
      
      
      //메소드 내에 선언되는 변수의 타입이 기본 타입일 때 null로 초기화 못시킵니다.
      //int myInt = null ;   //Type mismatch: cannot convert from null to int
      //boolean mybool = null ; // Type mismatch: cannot convert from null to boolean
      
      //double myDouble = null ;  //Type mismatch: cannot convert from null to double
      
      Integer myInt2 = null ;
      
      
      String strVar11 = "신민철";
      String strVar22 = "신민철";
      
      System.out.println("strVar1메모리어드레스: " + System.identityHashCode(strVar11));
      System.out.println("strVar1메모리어드레스: " + System.identityHashCode(strVar22));
      
      if (strVar11 == strVar22) {
         System.out.println("strVar1과 strVar2는 참조가 같음");
         
      } else {
         System.out.println("strVar1과 strVar2는 참조가 다름");

      }
      
      if (strVar11.equals(strVar22)) {
         System.out.println("strVar1과 strVar2는 문자열이 같음");
         
      } else {
         System.out.println("strVar1과 strVar2는 문자열이 다름");

      }
      
      String strVar3 = new String("신민철");
      String strVar4 = new String("신민철");
      
      System.out.println("strVar1메모리어드레스: " + System.identityHashCode(strVar3));
      System.out.println("strVar1메모리어드레스: " + System.identityHashCode(strVar4));
      
      if (strVar3 == strVar4) {
         System.out.println("strVar3과 strVar4는 참조가 같음");
         
      } else {
         System.out.println("strVar3과 strVar4는 참조가 다름");

      }
      
      if (strVar3.equals(strVar4)) {
         System.out.println("strVar3과 strVar4는 문자열이 같음");
         
      } else {
         System.out.println("strVar3과 strVar4는 문자열이 다름");

      }
	}
}

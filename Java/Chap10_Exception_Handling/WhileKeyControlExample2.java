package sec05.p438;

import java.io.IOException;
import java.util.Scanner;

public class WhileKeyControlExample2 {

   public static void main(String[] args) throws IOException  {

      boolean run = true;
      
      int speed = 0;
      
      //입력문자열을 저장할 변수
      String inputString;
      
      //문자열 입력을 받기 위한 클래스(프로그램)를 메모리에 로드
      //Resource leak: 'scanner' is never closed
      try ( Scanner scanner = new Scanner(System.in) ) {
	      while(run) {
	         System.out.println("-----------------------------");
	         System.out.println("1.증속 | 2.감속 | 3.중지");
	         System.out.println("-----------------------------");
	         System.out.print("선택: ");
	
	         //사용자의 문자열 입력을 처리하는 메소드 
	         inputString = scanner.next();
	         
	         if (inputString.equals("1")) {
	            speed++;
	            System.out.println("현재 속도=" + speed);
	         } else if (inputString.equals("2")) {
	            if (speed > 0) {
	               speed--;
	               System.out.println("현재 속도=" + speed);
	            } else {
	               System.out.println("현재속도가 0 이므로 감속을 못합니다.");
	               System.out.println("속도를 올리세요");
	            } 
	         } else if (inputString.equals("3")) {
	            run = false;
	         
	         } else {
	            System.out.println("1,2,3 중 하나를 눌러주세요");
	         }
	      }	//end while
      //scanner.close();
   } catch (Exception e) {
	   System.out.println("오류 발생");
   }
      System.out.println("프로그램 종료");
   }
}


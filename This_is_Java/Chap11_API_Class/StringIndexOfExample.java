package sec07;

public class StringIndexOfExample {

	public static void main(String[] args) {
		String subject = "자바 프로그래밍 자바 프로그래밍";
	    //                01 2 34567 8 90 1 23456
	      
	    //앞에서 부터 뒤로 매개변수의 문자열을 찾아서 첫 번째 찾은 문자열의 시작위치를 정수로 반환
	    int location = subject.indexOf("프로그래밍");
	    System.out.println(location);   //3
	    
	    //명시된 위치에서 뒤로 매개변수의 문자열을 찾아서 문자열의 시작위치를 정수로 반환
	    int location1 = subject.indexOf("프로그래밍", 5);
	    System.out.println(location1);  //12
	    
	    
	    //뒤에서 부터 앞으로 매개변수의 문자열을 찾아서 첫 번째 찾은 문자열의 시작위치를 정수로 반환
	    int location2 = subject.lastIndexOf("프로그래밍");
	    System.out.println(location2);  //12
	    
	    //명시된 위치에서 앞으로 매개변수의 문자열을 찾아서 첫 번째 찾은 문자열의 시작위치를 정수로 반환
	    int location3 = subject.lastIndexOf("프로그래밍", 13);
	    System.out.println(location3);  //12  <--주의
	    
	    //명시된 위치에서 앞으로 매개변수의 문자열을 찾아서 첫 번째 찾은 문자열의 시작위치를 정수로 반환
	    int location5 = subject.lastIndexOf("프로그래밍", 9);
	    System.out.println(location5);  //3  <--주의
	    
	    
	    int location4 = subject.lastIndexOf("자바", 13);
	    System.out.println(location4);  //9
	    
	    //int location = subject.indexOf("로");
	    
	    if(subject.indexOf("자바") == -1) {
	       System.out.println("자바와 관련없는 책이군요");
	    } else {
	       System.out.println("자바와 관련된 책이군요");
	    
	    }
	}
}
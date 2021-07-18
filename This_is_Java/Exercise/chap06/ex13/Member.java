package chap06.ex1314;

public class Member {
	//13. 클래스 선언
	String name;
	String id;
	String password;
	int age;
	
	//14. 생성자 추가 (name, id 필드를 외부에서 받은 값으로 초기화)
	Member(String name, String id) {
		this.name = name;
		this.id = id;
	}
}

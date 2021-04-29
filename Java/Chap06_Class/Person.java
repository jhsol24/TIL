package intro.ex01;

public class Person {
	
	//1. Field : Attribute of class Person
	public String name;
	private String phoneNumber ="000-0000-0000";
	int age = 1;
	private String email;
	
//	name = "James"; 필드는 메소드 내에서만 값을 할당할 수 있다.
	
	//2. Constructor
	public Person() {
		System.out.println("기본생성자(NoArgsConstructor)를 사용함");
	}

////	private Person(String name, String phoneNumber, int age, String email) {
	public Person(String name, String phoneNumber, int age, String email) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.age = age;
		this.email = email;
		System.out.println("모든 필드를 매개변수로 갖는 생성자(AllArgsConstructor)가 사용됨");
	}
	
	//3. Method
	//반환값(리턴타입)이 있는 메소드: return 실행문이 포함됨
	//반환값(리턴타입)이 없는 메소드: return 실행문이 포함될수도 안될수도
	
	public int returnAge() {
//		int myAge = this.age;
		System.out.println("객체에 설정된 나이:" + this.age);
		return this.age;	//명시된 값을 호출한 메소드에 반환하고 이 메소드를 종료합니다.
	}
	
	public void returnName() {
		System.out.println("객체에 설정된 이름:" + this.name);
	}
	
	public void returnName2() {
		System.out.println("객체에 설정된 이름:" + this.name);
		return;
	}
	
	public String getPhoneNumber() {
		
		if (this.phoneNumber == null) {
			this.phoneNumber = "3333-3333";
		}
		return this.phoneNumber;
	}
}

package intro.ex01;

public class PersonExample {

	public static void main(String[] args) {
		
		//로컬 변수인데 사용자 클래스타입의 로컬 변수
		Person myPerson1 = new Person();	//객체생성
		//name, email: null
		//age: 1
		//phoneNumber: 000-0000-0000
		
//		myPerson1.phoneNumber = "222-22222-2222"; //private 접근제어이므로 컴파일 오류
		myPerson1.age = 17;
		System.out.println("name: " + myPerson1.name);
		System.out.println("age: " + myPerson1.age);
//		Person.age = 35;	
		
		Person myPerson2 = new Person("James", "555-5555-5555", 38, "kingjames@nba.com");
		
//		String myPhoneNumber = myPerson2.phoneNumber();	//The method phoneNumber() is undefined for the type Person
		String myPhoneNumber = myPerson2.getPhoneNumber();
		System.out.println("myPerson2.phoneNumber:" + myPhoneNumber);
		
//		Person myPerson3 = new Person("Jams");	//Compile Error, No Constructor with class Person
	}

}

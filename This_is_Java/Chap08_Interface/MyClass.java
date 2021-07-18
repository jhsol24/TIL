package sec02.p347;

public class MyClass {
	
	//Field
	RemoteControl rc = new Television();

	//Constructor
	public MyClass(RemoteControl rc) {
		super();
		this.rc = rc;
	}
	
	//Getter-Setter
	public RemoteControl getRc() {
		return rc;
	}

	public void setRc(RemoteControl rc) {
		this.rc = rc;
	}
	
	//Method
	void methodA() {
		//Local Variables
		RemoteControl rc = new Audio();
		rc.setVolume(5);
	}
	void methodB(RemoteControl rc) {
		
	}
	
	//Another Class(ex. main()가 있는 클래스에서 MyClass의 methodB를 사용할 때는 다음처럼 코드 작성
	//새로운 클래스 만들어서 해야하지만 해당 클래스에서 작성했기 때문에 오류 없애기 위해 main 메소드로 작성함
	
	public static void main(String[] args) {
	
		MyClass myClass = new MyClass(new Television());
		
		myClass.methodB(new Audio());
	}
}

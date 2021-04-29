package sec01;

public class CellPhone {
	//Field
	String model;
	String color;
	
	//Constructor
//	Source > Generate Constructor 하면 DmbCellPhone 에서 오류	
//	public CellPhone(String model, String color) {
//		super();
//		this.model = model;
//		this.color = color;
//	}
	
	//Method
	void powerOn() { System.out.println("Power on"); }
	void powerOff() { System.out.println("Power off"); }
	void bell() { System.out.println("Bell rings"); }
	void sendVoice(String message) { System.out.println("Me: " + message); }
	void receiveVoice(String message) { System.out.println("You: " + message); }
	void hangUp() { System.out.println("Hangup the phone"); }
}

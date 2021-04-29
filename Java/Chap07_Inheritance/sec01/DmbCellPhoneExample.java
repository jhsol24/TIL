package sec01;

public class DmbCellPhoneExample {
	public static void main(String[] args) {
		//DmbCellPhone 객체 생성
		DmbCellPhone dmbCellPhone = new DmbCellPhone("iPhone 12", "Black", 10);
		
		//CellPhone 으로부터 상속받은 Field
		System.out.println("Model: " + dmbCellPhone.model);
		System.out.println("Color: " + dmbCellPhone.color);
		
		//DmbCellPhone 의 Field
		System.out.println("Channel: " + dmbCellPhone.channel);
		
		//CellPhone 으로부터 상속받은 Method 호출
		dmbCellPhone.powerOn();
		dmbCellPhone.bell();
		dmbCellPhone.sendVoice("Hello");
		dmbCellPhone.receiveVoice("Hi, this is James");
		dmbCellPhone.sendVoice("Oh, nice to meet you");
		dmbCellPhone.hangUp();
		
		//DmbCellPhone 의 Method 호출
		dmbCellPhone.turnOnDmb();
		dmbCellPhone.changeChannelDmb(12);
		dmbCellPhone.turnOffDmb();
	}
}

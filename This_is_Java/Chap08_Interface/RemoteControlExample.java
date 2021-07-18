package sec02.p347;

public class RemoteControlExample {
	public static void main(String[] args) {
		//익명 구현 객체 : 이름이 없는 구현 객체(Class)
		RemoteControl rc = new RemoteControl() {
			public void turnOn() { /*Sentence*/ }
			public void turnOff() { /*Sentence*/ }
			public void setVolume(int volume) { /*Sentence*/ }
		};
	}
}

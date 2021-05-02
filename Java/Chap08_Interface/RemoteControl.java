package sec02.p347;

public interface RemoteControl {
	//Constant Field
	public int MAX_VOLUME = 10;
	public int MIN_VOLUME = 0;
	
	//Abstract Method
	public void turnOn();
	public void turnOff();
	public void setVolume(int volume);
//	public void mute();	//변수 정의가 안되어 있으므로 기기들에서 오류남 > Solution : Default Method
	
	//Default Method
	default void setMute(boolean mute) {
		if(mute) {
			System.out.println("Mute");
		} else {
			System.out.println("Unmute");
		}
	}
	
	//Static Method
	static void changeBattery() {
		System.out.println("Change Battery");
	}
}

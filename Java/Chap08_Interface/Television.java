package sec02.p347;

public class Television implements RemoteControl {
	//Field
	private int volume;
	
	//turnOn() 추상 메소드의 실체 메소드
	@Override
	public void turnOn() {
		
		System.out.println("Turn on TV");
		
	}

	//turnOn() 추상 메소드의 실체 메소드
	@Override
	public void turnOff() {
		
		System.out.println("Turn off TV");
		
	}

	//turnOn() 추상 메소드의 실체 메소드
	@Override
	public void setVolume(int volume) {
		if(volume>RemoteControl.MAX_VOLUME) {
			this.volume = RemoteControl.MAX_VOLUME;
		} else if(volume<RemoteControl.MIN_VOLUME) {
			this.volume = RemoteControl.MAX_VOLUME;
		} else {
			this.volume = volume;
		}
		System.out.println("Current TV volume: " + this.volume);
	}
}

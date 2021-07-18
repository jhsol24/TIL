package sec02.p347;

public class Audio implements RemoteControl {
	//Field
	private int volume;
	
	//turnOn() 추상 메소드의 실체 메소드
	@Override
	public void turnOn() {			
		System.out.println("Turn on Audio");
	}

	//turnOn() 추상 메소드의 실체 메소드
	@Override
	public void turnOff() {			
		System.out.println("Turn off Audio");
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
		System.out.println("Current Audio volume: " + this.volume);
	}
}

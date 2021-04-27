package sec01;

public class SwitchNoBreakCaseExample {
	public static void main(String[] args) {
		int time = (int)(Math.random()*4 + 8);
		System.out.println("[Current time: " + time + " AM");
		
		switch(time) {
		case 8:
			System.out.println("Go to work");
		case 9:
			System.out.println("Have a meeting");
		case 10:
			System.out.println("Do business");
		case 11:
			System.out.println("Go outside work");
		}
	}
}

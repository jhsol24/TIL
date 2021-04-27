package sec01;

public class SwitchExample {
	public static void main(String[] args) {
		int num = (int)(Math.random()*6 + 1);
		
		switch(num) {
		case 1:
			System.out.println("number 1 is selected");
			break;
		case 2:
			System.out.println("number 2 is selected");
			break;
		case 3:
			System.out.println("number 3 is selected");
			break;
		case 4:
			System.out.println("number 4 is selected");
			break;
		case 5:
			System.out.println("number 5 is selected");
			break;
		case 6:
			System.out.println("number 6 is selected");
			break;
		}
	}
}

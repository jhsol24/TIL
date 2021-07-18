package sec01;

public class IfExample {
	public static void main(String[] args) {
		int score = 93;
		
		if(score>=90) {
			System.out.println("Score is over 90");
			System.out.println("Grade is A");
		}
		
		if(score<90)
			System.out.println("Score is under 90");
			// if 문과는 상관없는 실행문
			System.out.println("Grade is B");
	}
}

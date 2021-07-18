package sec01;

public class IfNestedExample {
	public static void main(String[] args) {
		int score = (int)(Math.random()*20) + 81;	//random 하게 뽑은 수를 활용한 점수
		System.out.println("Score: " + score);
		
		String grade;
		
		if(score>=90) {
			if(score>=95) {grade = "A+";}	//if 중첩문
			else {grade = "A";}
		} else {
			if(score>=85) {grade = "B+";}	//if 중첩문
			else {grade = "B";}
		}
		
		System.out.println("Grade: " + grade);
	}
}

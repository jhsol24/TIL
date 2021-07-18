package sec01;

public class ForSumFrom1To100Example {
	public static void main(String[] args) {
		int sum = 0;
		
		for(int i=1; i<=100; i++) {
			sum += i;
		}
		
		System.out.println("Sum of 1~100: " + sum);
	}
}

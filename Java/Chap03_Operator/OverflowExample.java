package sec01;

public class OverflowExample {
//	public static void main(String[] args) {
//		int x = 1000000;
//		int y = 1000000;
//		int z = x * y;
//		//범위 초과로 Garbage 값이 출력됨
//		System.out.println(z);
//	}
	
	public static void main(String[] args) {
		long x = 1000000;
		long y = 1000000;
		long z = x * y;
		//long 을 활용해 오버플로우 해결
		System.out.println(z);
		}
	}

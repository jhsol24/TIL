package wisenutCTEx;

public class Game369 {
	public static void main(String[] args) {
		
		int cnt = 0;		//초기값 설정
		
		for (int i = 1; i <= 100; i++) {
			
			int x = i / 10;		//10의 자리 숫자
			int y = i % 10; 	//1의 자리 숫자
			
			if (x==3 || x==6 || x==9) {
				if (y==3 || y==6 || y==9) {
					cnt += 2;
				} else {
					cnt += 1;
				}
			} else if (y==3 || y==6 || y==9) {
				cnt += 1;
			}
		}
		System.out.println(cnt);
	}
}

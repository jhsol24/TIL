package sec01;

public class BreakOutterExample {
	public static void main(String[] args) {
		Outter:
		for(char upper='A'; upper<='Z'; upper++) {
			//Inner:
			for(char lower='a'; lower<='z'; lower++) {
				System.out.println(upper + "-" + lower);
				if(lower=='g') {
					break Outter;
					//break Inner;
					//break; //그냥 break하면 Inner 부분으로 나감
				}
			}
		}
		System.out.println("프로그램 실행 종료");
	}
}

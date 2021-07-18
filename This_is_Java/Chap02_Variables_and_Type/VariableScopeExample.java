package sec01;

public class VariableScopeExample {
	public static void main(String[] args) {
		int v1 = 15;
		// if 블럭 안에서 생성된 변수는 해당 블럭에서만 사용 가능
		if(v1>10) {
			int v2 = v1 - 10;
		}
		//int v3 = v1 + v2 + 5; //v2 변수를 사용할 수 없기 때문에 컴파일 에러
	}
}

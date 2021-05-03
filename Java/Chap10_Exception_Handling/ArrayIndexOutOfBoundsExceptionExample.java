package sec01;

public class ArrayIndexOutOfBoundsExceptionExample {
	public static void main(String[] args) {
		if(args.length == 2) {
			String data1 = args[0];
			String data2 = args[1];
			System.out.println("args[0]: " + data1);
			System.out.println("args[1]: " + data2);
		} else {
			System.out.println("[Run Solution]");
			System.out.println("java  ArrayIndexOutOfBoundsException  ");
			System.out.println("value 1   value 2");
		}
	}
}

//오류 없이 실행하려면 Run > Run Configurations > Arguments > Program arguments 입력란에
//두 개의 매개값을 입력하고 Run
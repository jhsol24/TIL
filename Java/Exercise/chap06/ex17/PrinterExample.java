package chap06.ex17;

public class PrinterExample {
	public static void main(String[] args) {
		//17. 정적 메소드로 변경하면  클래스이름.메소드로 출력 가능
		//Printer printer = new Printer();
		Printer.println(10);
		Printer.println(true);
		Printer.println(5.7);
		Printer.println("홍길동");
	}
}

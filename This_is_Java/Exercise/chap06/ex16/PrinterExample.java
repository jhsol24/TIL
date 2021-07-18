package chap06.ex16;

public class PrinterExample {
	public static void main(String[] args) {
		//16. Printer 객체 생성해서 println 메소드를 호출
		Printer printer = new Printer();
		printer.println(10);
		printer.println(true);
		printer.println(5.7);
		printer.println("홍길동");
	}
}

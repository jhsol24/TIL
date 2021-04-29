package sec01;

public class StringEqualsExample {
	public static void main(String[] args) {
		String strVar1 = "Kyrie";
		String strVar2 = "Kyrie";
		
		if(strVar1 == strVar2) {
			System.out.println("strVar1 and strVar2 have same reference");
		} else {
			System.out.println("strVar1 and strVar2 have different reference");
		}
		
		if(strVar1.equals(strVar2)) {
			System.out.println("strVar1 and strVar2 have same string");
		}
		
		String strVar3 = new String("Kyrie");
		String strVar4 = new String("Kyrie");
		
		if(strVar3 == strVar4) {
			System.out.println("strVar3 and strVar4 have same reference");
		} else {
			System.out.println("strVar3 and strVar4 have different reference");
		}
		
		if(strVar3.equals(strVar4)) {
			System.out.println("strVar3 and strVar4 have same string");
		}
	}
}

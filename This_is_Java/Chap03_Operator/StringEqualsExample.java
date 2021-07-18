package sec01;

public class StringEqualsExample {
	public static void main(String[] args) {
		String strVar1 = "Luka";
		String strVar2 = "Luka";
		String strVar3 = new String("Luka");
		
		System.out.println( strVar1 == strVar2);
		System.out.println( strVar1 == strVar3);
		System.out.println();
		System.out.println( strVar1.equals(strVar2));
		System.out.println( strVar1.equals(strVar3));
	}
}

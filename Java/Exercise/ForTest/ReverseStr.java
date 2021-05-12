package wisenutCTEx;

public class ReverseStr {
	public static void main(String[] args) {
		String str = "abcde";
		
		// reverse
		StringBuffer sb = new StringBuffer(str);
		String reversedStr = sb.reverse().toString();
		System.out.println(reversedStr); // edcba 
	}
}

//	public static void main(String[] args) {
//		String str = 'abcde';
//		
//		char[] arr = str.toCharArray();
//		char[] reversedArr = new char[arr.length];
//		for(int i=0; i<arr.length; i++) {
//			reversedArr[arr.length-1-i] = arr[i];
//		}
//		String reversedStr = new String(reversedArr);
//		System.out.println(reversedStr);
//	}

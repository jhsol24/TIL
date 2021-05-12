package wisenutCTEx;

public class BubbleSort {
    public static void main(String []args) {
    	
    	//정렬할 배열
    	int[] arr = { 4, 54, 2, 8, 63, 7, 55, 56 };
        
    	//i는 배열 길이부터 1씩 감소
        for(int i=arr.length; i>0; i--) {
        	//가장 큰 원소(가장 오른쪽)부터 고정되므로 비교할 인덱스의 끝번호가 1씩 감소
        	for(int j=0; j<i-1; j++) {
        		//현재 원소가 다음 원소보다 클 경우 교환
        		if(arr[j] > arr[j+1]) {
        			int tmp = arr[j];
        			arr[j] = arr[j+1];
        			arr[j+1] = tmp;
        		}
        	}
        }
        //정렬된 순서에 따라 배열을 출력
        for(int k=0; k < arr.length; k++) {
    		System.out.print(arr[k] + ", ");
    	}
    }
}

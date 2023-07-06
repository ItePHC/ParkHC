package day0623;

import java.util.Scanner;

public class ArrScannerSum_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 0번쨰 값 : 55
		 1번쨰 값 : 22
		 2번쨰 값 : 34		
		 3번쨰 값 : 49
		 4번쨰 값 : 72
		 
		 ========================
		 [입력값 확인]
		 1번째 값 : 55 
		 2번쨰 값 : 22
		 3번쨰 값 : 34		
		 4번쨰 값 : 49
		 5번쨰 값 : 72
		 ========================
		 총 합계 : 232
		 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int [] data;
		data = new int [5];
		
		int sum = 0;
		
		//값 입력
		for(int i = 0; i < data.length; i++) {
			System.out.print(i + "번째 값 : ");
			data[i] = sc.nextInt();
			sum += data[i];
		}
			
		//값 출력
			System.out.println("[입력값 확인]");
		for(int i = 0; i < data.length; i++) {
			System.out.println((i + 1) + "번째 값 : " + data[i]);	
			}
		System.out.println("총 합계 : " + sum);
		
	}

}

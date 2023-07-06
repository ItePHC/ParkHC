package day0623;

import java.util.Scanner;

public class TempNumChange_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 순서 바꾸기
		
		int a = 10, b = 20;
		System.out.println("a = " + a + ", b = " + b);
		
		int temp = a;		//temp(비어있는) 자리로 a를 옮김
		a = b;				//빈 a 자리로 b를 옮김
		b = temp;			//a를 옮김으로서 b가 빔 
		
		System.out.println("a = " + a + ", b = " + b);
		
		int [] m = {5, 7, 9};
		
		for(int t : m)
			System.out.print(t + " ");
		System.out.println();
		System.out.println("0번과 2번 순서 바꾸기");
		
		int temp1 = m[0];
		m[0] = m[2];
		for(int t : m)
		System.out.print(t + " ");
		System.out.println();
		System.out.println();
		System.out.println();
		
		//10개의 수를 입력받은 뒤 오름차순으로 순서를 정렬하시오
		
		int [] data;
		data = new int[10];
		int num = 0;
		
		Scanner sc = new Scanner(System.in);
		
		for(int i = 0; i < data.length; i++) {
			System.out.print((i+1) + "번째 수를 입력해주세요 : ");
			data[i] = sc.nextInt();
		}
		
		System.out.println("[입력값 확인]");
		
		for(int i = 0; i < data.length; i++) {
			System.out.println((i + 1) + "번째 값 : " + data[i]);
			num += data[i];
		}
		
		
		System.out.println(num);
		
		/*
		
		int max = data[0]; //첫 데이터를 무조건 최대값에 저장
		int min = data[0];
		
		//두번째 값 부터 끝까지 Max와 비교
		for(int i = 1; i < data.length; i++) {
			if(max<data[i])
				max = data[i];
		}
		System.out.println("최대값 : " + max);
		
		for(int i = 1; i < data.length; i++) {
			if(min > data[i])
				min = data[i];
		}
		System.out.println("최소값 : " + min);
		
		*/
		
	}

}

package day0620;

import java.util.Scanner;

public class SwitchTest_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int num;
		
		System.out.println("숫자 입력 : ");
		num = sc.nextInt();
		switch (num) {
		case 1:
			System.out.println("숫자 1입니다");
			break;
		case 2:
			System.out.println("숫자 2입니다");
			break;
		case 3:
			System.out.println("숫자 3입니다");
			break;
		default:
			System.out.println("숫자 1, 2, 3이 아닙니다");
			break;
		}
		int calc;
		calc = num%2;
				
		switch (calc) {
		case 0:
			System.out.println(num + "은(는) 짝수입니다");
			break;

		default:
			System.out.println(num + "은(는) 홀수입니다");
			break;
		}
		
		// if문
		if (num%2==0)
			System.out.println(num + "은(는) 짝수입니다");
		else
			System.out.println(num + "은(는) 홀수입니다");
		
		//calc=0? "은(는) 짝수입니다" : "은(는) 홀수입니다"; 
		
		if (calc==0)
			System.out.println(num + "은(는) 짝수입니다");
		else
			System.out.println(num + "은(는) 홀수입니다");
	}

}
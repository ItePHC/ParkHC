package day0619;

import java.util.Scanner;

public class QuizOper_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 월 급여를 입력해서 만, 천, 백, 십, 일원 갯수를 출력해보자
		// 예 : 금액을 입력하시오
		
		/*
		 * 2565325
		 * ==============
		 * 만원 : 256
		 * 천원 : 5
		 * 백원 : 3
		 * 십원 : 2
		 * 일원 : 5
		 */
		
		Scanner sc = new Scanner(System.in);
		
		
		int money;
		/*int T10 = money / 10000; // 만
		int T = money - T10 * 10000;
		
		int M10 = T / 1000;  // 천
		int M = T - M10 * 1000;
		
		int Ten10 = M / 100; // 백
		int Ten = M - Ten10 * 100;
		
		int C10 = Ten / 10; // 십
		int C = Ten - C10 * 10;
		
		int O = C; // 일
			
		
		System.out.println("금액을 입력하시오 : ");
		money = sc.nextInt();
		
		
		
		
		System.out.println("만원 : " + T10);
		System.out.println("천원 : " + M10);
		System.out.println("백원 : " + Ten10);
		System.out.println("십원 : " + C10);
		System.out.println("일원 : " + O);
		*/
		System.out.println("금액을 입력하시오 : ");
		money = sc.nextInt();
		
		System.out.println("만원 : " + money / 10000);
		System.out.println("천원 : " + (money % 10000) / 1000);
		System.out.println("백원 : " + (money % 1000) / 100);
		System.out.println("십원 : " + (money % 100) / 10 );
		System.out.println("일원 : " + (money % 10));
		
	}

}
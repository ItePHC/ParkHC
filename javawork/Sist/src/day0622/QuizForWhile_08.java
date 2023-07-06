package day0622;

import java.util.Scanner;

public class QuizForWhile_08 {

	public static void quiz1() {
		/*
		나이를 반복해서 입력받는다
		0이 되면 빠져나와서 출력한다
		나이가 50이상일 경우 a변수 증가
		나이가 30이상일 경우 b변수 증가
		나이가 30이상일나이가 30이상일 경우 b변수 증가 
		그 나머지는 c변수 증가
		=====================================
		50세 이상 : 3명
		30세 이상 50세 미만: 2명
		그 외 : 1명
		*/
		Scanner sc = new Scanner(System.in);
		int age;
		int over_50 = 0;
		int over_30 = 0;
		int another = 0;
		
		
		
		while(true) {
			System.out.print("나이를 입력해주세요");
			age = sc.nextInt();
			
			if(age > 100) {
				System.out.println("잘못된 입력입니다.");
				over_50--;
			}
			if(age < 0) {
				System.out.println("잘못된 입력입니다.");
				another--;
			}
			
			if(age == 0) {
				System.out.println("프로그램 종료");
				break;
			}
				
			
			if(age >= 50)
				over_50++;
			else if (age >= 30)
				over_30++;
			else
				another++;
	
			
		}
		System.out.println("50세 이상 : " + over_50 +"명");
		System.out.println("30세 이상 : " + over_30 +"명");
		System.out.println("그 외: " + another +"명");
		
	}
	
	public static void quiz2() {
		//Q. 총 10개의 다양한 숫자(양수, 음수)를 입력받아 양수의 갯수와 음수의 갯수를 구하시오
		/*
		1 : 45
		2 : -23
		3 : 0
		4 : 80
		...
		10 : 30
		===================
		양수 갯수 : 6
		음수 갯수 : 3
		0 : 0
		*/
		
		Scanner sc = new Scanner(System.in);
		int pn = 0; // 양수 positive number
		int nn = 0; // 음수 negative number
		int zero = 0; // 0
		int num;	//입력할 수
		
		for(int i = 1; i <=10; i++) {
			System.out.print(i + "번 숫자를 입력해주세요");
			num=sc.nextInt();
			
			if(num > 0) {
				pn++;
			}
			
			else if (num < 0) {
				nn++;
			}
			
			else 
				zero++;	
		}
		System.out.println("양수 갯수 : " + pn);
		System.out.println("음수 갯수 : " + nn);
		System.out.println("0의 갯수 : " + zero);
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// quiz1();
		quiz2();
	}

}

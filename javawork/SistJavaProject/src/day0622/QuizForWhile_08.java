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
			
			if(age == 0) 
				break;
			
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
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		quiz1();
	//	quiz2();
	}

}

package day0621;

import java.util.Scanner;

public class ScannerFor_11 {
	
	public static void numSum() {
		//합계를 구할 숫자?		n(100)
		//1부터 n(100)까지의 합은 5050입니다
		
	Scanner sc = new Scanner(System.in);
	
	int num;
		
	System.out.print("합계를 구할 숫자를 입력해주세요 : ");
	num = sc.nextInt();
	
	
	int sum = 0;
	
	for(int i = 0; i <= num; i++ ) {
		sum += i;
	}
		System.out.println("1부터 " + num + "까지의 합은 " + sum + "입니다.");
	}
	//========================================================================================================================================
	
	public static void numSum_2() {
		Scanner sc = new Scanner(System.in);
		int num;
		System.out.print("합계를 구할 숫자를 입력해주세요 : ");
		num = sc.nextInt();
		int i = 0;
		int sum = 0;
		while(true) {
			i++;
			if(i>num)
				break;
			sum += i;
		}
		System.out.println("1부터 " + num + "까지의 합은 " + sum + "입니다.");
	}
	//========================================================================================================================================
	public static void factorialTest() {
		//1! = 1
		//2! = 2
		//3! = 6
		//4! = 24
		
		//10! 출력
		int result = 1;
		for (int i = 1; i<=10; i++) {
			result *= i;
			System.out.println(i + "! = " + result);
		}	
	}
	//========================================================================================================================================
	public static void quizFact() {
		//팩토리얼을 구할 숫자를 입력
		//5! = 120
		
		Scanner sc = new Scanner(System.in);
		int input;
		System.out.print("팩토리얼을 구할 숫자를 입력 : ");
		input = sc.nextInt();
		
		int result = 1;
		for(int i = 1; i <= input; i++) {
			result *= i;
		}
		System.out.println(input + "! = " + result);
	}
	
	
	public static void quizFact_while() {
		//팩토리얼을 구할 숫자를 입력_while
		//5! = 120
		
		Scanner sc = new Scanner(System.in);
		int input;
		System.out.print("팩토리얼을 구할 숫자를 입력 : ");
		input = sc.nextInt();
		
		int result = 1;
		int i = 0;
		while(true) {
			i++;
			
		if(i>input)
			break;
		
		result *= i;
		}
		System.out.println(input + "! = " + result);
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// numSum_2();
		//factorialTest();
		quizFact();
		//quizFact_while();
	}

}
package day0622;

import java.util.Scanner;

public class QuizFOrWhile_02 {
	
	public static void quiz1() {
		// 점수를 입력하면 합계를 구하시오
		// 1 ~ 100 이 아니면 제외(continue)
		// 0을 입력시 프로그램 종료
		
		int sum = 0;
		int i; // 입력할 점수
		int cnt = 0;
		double avg;
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			
			System.out.print("점수를 입력해주세요 : \n0을 입력시 프로그램이 종료됩니다.");
			i = sc.nextInt();
			
			
			if(i == 0) {
				break;
			}
			
			if(i < 1 || i > 100) {
				System.out.println("잘못된 수를 입력하였습니다");
				System.out.println();
				continue;
			}
			
			
			
			sum += i;
			cnt++;
			
			
		}
		System.out.println("합계는 " + sum + "입니다" );
		avg = (double)sum/cnt;
		System.out.println("평균은 " + avg + "입니다");
		
	}
	
	public static void quiz2() {
		//점수를 반복해서 입력하면 합계 평균을 구하시오
		//끝이라고 입력시 프로그램 종료
		String end;
		int cnt = 0; 
		int sum = 0;
		int i;
		double avg; 
		Scanner sc = new Scanner(System.in);
		
		
		while(true) {
			System.out.print("점수를 입력해주세요 : ");
			end = sc.nextLine();
				
			if(end.equals("끝"))
				break;
			
			cnt++;
			i = Integer.parseInt(end);
			sum += Integer.parseInt(end);
			
			//continue
			if(i < 1 ||i < 1) {
				continue;
			}

		
		}
		System.out.println("합계 : " + cnt);
		avg = (double)sum/cnt;	
		System.out.println("평균 : " + avg);
	}
	
	public static void quiz3() {
		/*
		총 다섯개의 점수를 입력받다 합계를 구하시오
		만약 1~100이 아닐 경우 다시 입력받아라
		
		1번 점수 : 88
		2번 점수 : 99
		3번 점수 : 200
		**잘못 입력했습니다**
		3번 점수 : 33
		4번 점수 : 40
		5번 점수 : 
		=================
		합계 : 점
		*/
		
		Scanner sc = new Scanner(System.in);
		
		int sum = 0;
		int cnt;
		
	/*	
		for(int i = 1; i <= 5; i++) {
			System.out.print(i + "번 점수 : ");
			cnt = sc.nextInt();
			
			if(cnt > 100 || cnt < 1 ) {
				System.out.println("잘못 입력하였습니다.");
				
				i--;
				continue;
				}
			sum += cnt;
			}
		*/
		
		int su;
		
		for(int i = 1; i<=5; i++) {
			System.out.print(i + "번 점수 : ");
			su = sc.nextInt();
			
		if(su<1 || su>100) {
		System.out.println("잘못 입력하였습니다");
		i--;
		continue;
			}
		sum += su;			
		}
		
		
		System.out.println("총점은 : " + sum + "점 입니다.");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		//quiz2();
		quiz3();
	}

}
package day0623;

import java.util.Scanner;

public class Match_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 랜덤수를 발생 시킨 후 그 숫자를 맞춰보자
		
		Scanner sc = new Scanner(System.in); 
		//1~100 사이의 랜덤수 발생
		
		int rnd = (int)(Math.random()*100+1); //랜덤수는 이미 정해짐
		int num; //맞출 랜덤수를 입력할 변수;
		
		// while문으로 랜덤수 맞춰보기
		/*
		while(true) {
			System.out.println("숫자 : ");
			num = sc.nextInt();

			if(num > rnd) {
				System.out.println(num + "보다 작습니다");}
			
				else if(num < rnd) 
					System.out.println(num + " 보다 큽니다");
					else {
						System.out.println("맞았습니다 정답은 " + rnd + "입니다.");
						
						break;
						}
			System.out.println("게임 종료");
					}
		*/
	
		
		// for문으로 랜덤수 맞추기 (남은기회 n회)
		
		int n = 10; // 남은 기회
		for(int cnt = 1; cnt <= n; cnt++) { 
			System.out.println("숫자를 입력해주세요 : (남은 기회 : " + (n-cnt+1) + "회)");
			num = sc.nextInt();
			
			if (num > rnd) {
				System.out.println(num + "보다 작습니다");
				System.out.println("남은 기회는 " + (n-cnt) + "회 입니다.");
				System.out.println();
				}
				
				else if(num < rnd) {
					System.out.println(num + " 보다 큽니다");
					System.out.println("남은 기회는 " + (n-cnt) + "회 입니다.");
					System.out.println();
				}
			
					else {
						System.out.println("맞았습니다 정답은 " + rnd + "입니다.");
						break;
						}
					}
		
		
		
			}
		}

		
		
		
		
		
		

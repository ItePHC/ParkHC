package day0619;

import java.util.Scanner;

public class IfTest_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		  int n = 20;
		if (n >= 100) {
			System.out.println("n은 100보다 크거나 같다");
			System.out.println("****");
			
		}
		else 
			System.out.println("n은 100보다 작다");
		
			
			System.out.println("프로그램 종료");
		
		*/
		
		//i가 홀수인지 짝수인지 구하기
		
		/*
		int i = 9;
		if (i % 2 == 1)
			System.out.println("i는 홀수입니다.");
		else
			System.out.println("i는 짝수입니다.");
		*/
		
		// if문을 이용해서 학점 구하기
		
		/*
		
		Scanner sc = new Scanner(System.in);
		
		int score;
		
		System.out.println("점수를 입력해주십시오 : ");

		
		
		score = sc.nextInt();
	*/
		/*
		int score = 88;
		
		if (score >=90)
				System.out.println("A");
		else if(score >= 80)
			System.out.println("B");
		else if(score >= 70)
			System.out.println("C");
		else if (score >= 60)
			System.out.println("D");
		else 
			System.out.println("F");
		*/
		
		//학점을 삼항 연산자를 이용하여 구해보기
		/*
		int score = 88;
		
		char grade = score >= 90? 'A' :
					 score >= 80? 'B' :
					 score >= 70? 'C' :
					 score >= 60? 'D' : 'F' ;
		System.out.println("학점은 " + grade + "입니다.");
		*/
		
		//점수를 입력하여 평가를 출력하시오
		/*
		 * 
		 * 당신의 점수는 ? : 88
		 * ===========
		 * 90점 이상 : 장학생
		 * 80점 이상 : 우수상 
		 * 80점 미만 : 재시험
		 * ===========
		 * 당신은 우수상입니다
		 * 
		 */
		
		int score;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("당신의 점수는 : ");
		score = sc.nextInt();
		
		String grade;

		if (score >= 90)
			grade = "장학생";
		else if (score >= 80)
			grade = "우수상";
		else 
			grade = "재시험";
		
		System.out.println("당신은 " + score + "점 이므로 평가는 " + grade +"입니다.");
		
		
	}


}
package day0621;

import java.util.Scanner;

public class QuizWhileTrue13_2 {

	public static void main(String[] args) {
		/*
		  점수를 반복해서 입력하다가 q나 Q를 입력하면 while문을 빠져나온 뒤
		  총 갯수, 총점, 평균을 출력하시오
		 */
		Scanner sc = new Scanner(System.in);
			
		String score;
		int cnt = 0;
		int sum = 0;
		double avg ;
			
		// System.out.println("점수를 입력해주세요 : \n(종료를 원하시면 Q를 눌러주세요)");
		// score = sc.nextLine();
		
		while(true) {
			System.out.println("점수를 입력해주세요 : \n(종료를 원하시면 Q를 눌러주세요)");
			score = sc.nextLine();

			if(score.equalsIgnoreCase("q")) 
				break;
			
			cnt++;
			sum += Integer.parseInt(score);
			
		}
		avg=(double)sum/cnt; // 둘다 정수이므로 double로 형변환
		
		System.out.println("[결과출력]");
		System.out.println("점수 갯수 : " + cnt);
		System.out.println("점수 총점 : " + sum + "점");
		System.out.printf("평균 : %.1f", avg);
		
	}
}
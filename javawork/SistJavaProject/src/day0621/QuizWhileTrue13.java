package day0621;

import java.util.Scanner;

public class QuizWhileTrue13 {

	public static void main(String[] args) {
		/*
		  점수를 반복해서 입력하다가 q나 Q를 입력하면 while문을 빠져나온 뒤
		  총 갯수, 총점, 평균을 출력하시오
		 */
		
		Scanner sc = new Scanner(System.in);
		//int input, tot = 0;
		//int cnt = 0;
		//double avg = 0;
		//String word;
		
		String score;
		int sum = 0;
		int cnt = 0;
		double avg;
		
		
		while(true) {
		System.out.println("점수를 입력해주세요 : (종료를 원하시면 Q를 입력해주세요.)");
		// input = sc.nextInt();
		score=sc.nextLine();
		
		
		//input = Integer.parseInt(word);
		//if(score.equalsIgnoreCase("q"))
		//	break;
		
		//tot += input;
		//cnt++;
		
		
		
		
		// if(score.equals("q") || score.equals("Q"))
		// if(score.equalsIgnoreCase("q"))
		if(score.charAt(0)=='q'||score.charAt(0)=='Q')
			break;
		

		cnt++;
		sum+=Integer.parseInt(score); //정수로 변환 후 합계변수에 누적
			
		}
		
		avg=(double)sum/cnt; // 둘다 정수이므로 double로 형변환
		
		System.out.println("[결과출력]");
		System.out.println("점수 갯수 : " + cnt);
		System.out.println("점수 총점 : " + sum + "점");
		System.out.printf("평균 : %.1f", avg);
		
		
	}

}

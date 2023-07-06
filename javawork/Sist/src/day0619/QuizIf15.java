package day0619;

import java.util.Scanner;

public class QuizIf15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		Scanner sc = new Scanner(System.in);
		int score;
		String msg;
		
		System.out.print("당신의 점수는?");
		score = sc.nextInt();
		
		msg = score >= 90? "장학생":
			score>= 80? "우수상" : "재시험";
				
		System.out.println("당신은 " + score + "이므로 평가는 " + msg);
		
	}

}

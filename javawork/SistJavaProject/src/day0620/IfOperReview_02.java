package day0620;

import java.util.Scanner;

public class IfOperReview_02 {

	public static void main(String[] args) {
		/*
		 * 평가메세지: 90점이상: 참잘함  80점이상: 잘함  80점미만: 다음기회에...
		 * (삼항연산자)
		 * 학점: 90점이상 A
		 * (If문)
		 * 점수를 입력하세요
		 * 88
		 * ==============
		 * 점수: 88점
		 * 평가메세지: 잘함
		 * 학점: B
		 */
		int score;
		char grade;
		String msg;
		Scanner sc=new Scanner(System.in);
		
		System.out.println("점수를 입력하세요");
		score=sc.nextInt();
		
		System.out.println("=================");
		System.out.println("점수: "+score+"점");
		
		grade=score>=90?'A':
				score>=80?'B':'C';
		
		if(score>=90)
			msg="참잘함";
		else if(score>=80)
			msg="잘함";
		else
			msg="다음기회에...";
				
		System.out.println("학점: "+grade);
		System.out.println("평가메세지: "+msg);

	}

}

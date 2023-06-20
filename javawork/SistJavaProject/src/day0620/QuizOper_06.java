package day0620;

import java.util.Scanner;

public class QuizOper_06 {

	public static void main(String[] args) {
		/*
		 이름을 입력하세요
		 강민호
		 3과목의 점수를 입력하세요
		 39
		 88
		 99
		 ===================
		 3과목점수: 39,88,99
		 평균: 75.33
		 -------------------
		 합격조건: 평균이 70점 이상이고, 각과목이 40점이상이면 합격
		 -------------------
		 강민호님은 불합격입니다
		 */
		Scanner sc=new Scanner(System.in);
		String name;
		int x,y,z;
		double avg;
		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("3과목의 점수를 입력하세요");
		x=sc.nextInt();
		y=sc.nextInt();
		z=sc.nextInt();
		
		avg=(x+y+z)/3.0;
		System.out.println("========================");
		System.out.println("3과목점수: "+x+","+y+","+z);
		System.out.printf("평균: %.2f\n",avg);
		
		if(avg>=70&&x>=40&&y>=40&&z>=40)
			System.out.println(name+"님은 합격입니다");
		else
			System.out.println(name+"님은 불합격입니다");
	}

}

package day0619;

import java.util.Scanner;

public class OperPractice {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int Math, Eng, Kor, tot;
		String name;
		double avg;
		
		
		
		
		
		System.out.print("이름 입력 : ");
		name = sc.nextLine();
		System.out.print("수학 점수 입력 : ");
		Math = sc.nextInt();
		System.out.print("영어 점수 입력 : ");
		Eng = sc.nextInt();
		System.out.print("국어 점수 입력 : ");
		Kor = sc.nextInt();
		
		tot = Math + Eng + Kor;
		avg = tot / 3;
		
		System.out.println("이름 : " + name);
		System.out.println("수학 점수 : " + Math);
		System.out.println("영어 점수 : " + Eng);
		System.out.println("국어 점수 : " + Kor);
		System.out.println("총점 : " + tot);
		
		char grade = (avg >= 90) ? 'A' : 
					 (avg >= 80)? 'B' :
					 (avg>= 70)? 'C' :
					 ((avg>=60)? 'D' : 'F');
		
		System.out.println("평균 : " + avg);
		System.out.println("학점 : " + grade); 
		
	}

}

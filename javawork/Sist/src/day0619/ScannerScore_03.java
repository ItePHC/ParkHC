package day0619;

import java.util.Scanner;

public class ScannerScore_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//콘솔창에 변수값을 입력받아서 출력할 것
		
		Scanner sc = new Scanner(System.in);
		
		String name;
		int kor, eng, math;
		int tot;
		double avg;
		
		System.out.print("학생의 이름은? ");
		name = sc.nextLine();
		System.out.print("국어 점수는? ");
		kor = sc.nextInt();
		System.out.print("영어 점수는? ");
		eng = sc.nextInt();
		System.out.print("수학 점수는? ");
		math = sc.nextInt();
		
		tot = kor + eng + math;
		avg = tot / 3.0;
		
		System.out.println("=================");
		System.out.println("학생명 : " + name);
		System.out.println("국어 점수 : " + kor);
		System.out.println("영어 점수 : " + eng);
		System.out.println("수학 점수 : " + math);
		System.out.println("=================");
		System.out.println("총점 : " + tot + "점");
		System.out.println("평균 : " + avg + "점");		
		
		
		
		
	}

}
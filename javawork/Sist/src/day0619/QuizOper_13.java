package day0619;

import java.util.Scanner;

public class QuizOper_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 이름입력 : 강호동 
		 * 키 : 177.5
		 * 몸무계 : 88 
		 * 
		 * ====================
		 * [BMI 정보]
		 * 이름 : 강호동
		 * 키 : 177.5cm
		 * 몸무계 : 88kg
		 * 
		 * 
		 * 표준 몸무계 : (키 - 100)*0.9kg
		 * 권장 표준 몸무계는 69.75kg입니다
		 */
		
		String name;
		double height, weight;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		name = sc.nextLine();
		System.out.print("키 입력 : ");
		height = sc.nextDouble();
		System.out.print("몸무계 입력 : ");
		weight = sc.nextDouble();
		
		double avgweight, BMI1, BMI2;
		
		avgweight = (height - 100) * 0.9;
		System.out.println("[BMI 정보]");
		System.out.println("이름 : " + name);
		System.out.println("키 : " + height + "cm");
		System.out.println("몸무계 : " + weight + "kg");
		System.out.println("표준몸무계는 " + avgweight + "kg 입니다");
		
		BMI1 = (height / 100); 
		BMI2 = weight / (BMI1 * BMI1);
		
		
		
		String BMI =  BMI2 < 18.5 ? "저체중" :
					BMI2 < 22.9 ? "정상" :
					BMI2 < 24.9 ? "위험 체중" :
					BMI2 < 29.9 ? "1단계 비만" : "2단계 비만";
		
		System.out.println("BMI 지수는 :" + BMI + "입니다.");
	
	 
		/*
		if (BMI2 < 18.5)
			System.out.println("저체중");
		else if (BMI2 < 22.9)
			System.out.println("정상");
		else if ( BMI2 < 24.9)
			System.out.println("과체중");
		else if ( BMI2 < 29.9)
			System.out.println("1단계 비만");
		else 
			System.out.println("2단계 비만");
	
		*/
		
	}

}
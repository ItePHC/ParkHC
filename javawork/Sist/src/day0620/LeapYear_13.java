package day0620;

import java.util.Calendar;
import java.util.Scanner;

public class LeapYear_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//윤년 공식 (YEAR % 4 == 0), 
		/* 년도를 입력 후 윤년인지 평년인지 출력하기
		 * 공식
		 * 년도를 4로 나누어서 나머지가 0이고 
		 * 년도를 100으로 나누어서 나머지가 0이 아니거나 
		 * 
		 * 년도를 400으로 나누어서 나머지가 0이면 윤년
		 *  
		 */
	
		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();
		
		int year;
		year = sc.nextInt();
		
		System.out.println("년도 입력");
		
		
		
		if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
			System.out.println(year + "년도는 윤년입니다");
		else
			System.out.println(year + "년도는 평년입니다");

		/*
		int curyear = cal.get(cal.YEAR);
		
		Calendar 사용하여 윤년 평년 구하기
		
		String result;
		if (curyear % 4 == 0 && year % 100 != 0 || year % 400 == 0)
		 System.out.println("올해는 윤년입니다");
		else
			System.out.println("올해는 평년입니다");
		*/	
	}

}
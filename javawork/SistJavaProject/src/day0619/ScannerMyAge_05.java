package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerMyAge_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 당신의 이름은?
		 * 당신의 출생년도는? 
		 * =====================
		 * 이름 :
		 * 현재년도 :
		 * 나이 : 
		 * 
		 */
		
		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);
		
		String name;
		int birth;
		int age;
		 
		
		int curYear = cal.get(cal.YEAR);
		
		System.out.print("당신의 이름은?");
		name = sc.nextLine();
		System.out.print("당신의 출생년도는?");
		birth = Integer.parseInt(sc.nextLine());
		
		age = curYear - birth;
		
		
		System.out.println("==================");
		System.out.println("이름 : " + name );
		System.out.println("현재년도 : " + cal.get(cal.YEAR));
		System.out.println("나이 : " + age);
		
		
	}

}
package day0620;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerReview_01 {

	public static void main(String[] args) {
		/*
		 * 태어난연도:1997
		 * 이름: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 동작구
		 * ======================
		 *   [개인정보]
		 * 이름: 홍길동
		 * 나이: 26세
		 * 연락처: 010-1234-5678
		 * 주소: 서울시 동작구
		 */

		Scanner sc=new Scanner(System.in);
		Calendar cal=Calendar.getInstance();
		
		int myear;
		String name,pnum,adr;
		
		System.out.print("태어난연도: ");
		myear=Integer.parseInt(sc.nextLine());
		System.out.print("이름: ");
		name=sc.nextLine();
		System.out.print("핸드폰번호: ");
		pnum=sc.nextLine();
		System.out.print("주소: ");
		adr=sc.nextLine();
		
		System.out.println("===================\n    [개인정보]");
		System.out.println("이름: "+name);
		System.out.println("나이: "+(cal.get(cal.YEAR)-myear));
		System.out.println("연락처: "+pnum);
		System.out.println("주소: "+adr);
		
	}

}

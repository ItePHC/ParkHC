package day0619;

import java.util.Scanner;

public class ScannerMyInfo_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 이름을 입력하세요 : 홍길동
		 * 핸드폰 번호 : 
		 * 주소
		 * =========================
		 * [개인정보]
		 * 이름 : 홍길동
		 * 핸드폰 번호 : 010-1234-5678
		 * 주소 : 경기도 군포시 ㄴㄴㄴ
		 * 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		String name;
		String phone;
		String adr;
		
		System.out.print("이름을 입력하세요 : ");
		name = sc.nextLine();
		System.out.print("전화번호를 입력하세요 : ");
		phone = sc.nextLine();
		System.out.print("주소를 입력하세요 : ");
		adr = sc.nextLine();
		
		System.out.println("=======================");
		System.out.println("\t[개인정보]");
		System.out.println("\t이름 : " + name);
		System.out.println("\t전화번호 : " + phone);
		System.out.println("\t주소 : " + adr);
		
				
		
		
		
		
	}

}


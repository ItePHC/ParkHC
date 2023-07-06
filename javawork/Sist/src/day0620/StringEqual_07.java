package day0620;

import java.util.Scanner;

public class StringEqual_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		String word;
		
		System.out.println("영어단어를 입력하세요");
		System.out.println("입력 예)happy, angel, rose, cat, food");
		word = sc.nextLine();
		
		System.out.println("입력한 문자열 : " + word);
		
		if(word.equals("angel"))
			System.out.println("천사입니다");
		else if(word.equalsIgnoreCase("happy"))
			System.out.println("행복하다");
		else if(word.equals("rese"))
			System.out.println("장미");
		else if(word.equals("cat"))
			System.out.println("고양이");
		else if(word.equals("food"))
				System.out.println("음식");
		else
			System.out.println("한글단어가 등록되지 않았습니다.");
	}

}

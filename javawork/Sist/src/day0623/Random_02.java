package day0623;

import java.util.Random;

public class Random_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Random r = new Random();
		
		System.out.println("0~9사이의 난수를 발생시켜보자");
		for(int i = 1; i<=3; i++) {
			int n = r.nextInt(10); //10을 넣음으로서 정수
			System.out.println(n);
		}
		System.out.println();
		System.out.println("========================");
		System.out.println();
		System.out.println("1에서 10 사이의 난수 발생");
		for(int i = 1; i <= 10; i++) {
			int n = r.nextInt(10)+1;
			System.out.println(n);
		}
		
		
	}

}

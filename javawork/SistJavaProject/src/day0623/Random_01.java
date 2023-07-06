package day0623;

public class Random_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 자바에서 난수를 구하는 방법
		1. Math.random() 매서드를 이용하는 방법
		2. Random 이라는 클래스를 생성해서 구하는 방법
		 
		*/
		
		System.out.println("기본 난수 5개발생");
		
		for(int i = 1; i<=5; i++) {
			double a = Math.random();	//0.xxxxxx ~ 0.999999~
			System.out.printf("%.2f\n",a);
		}
		
		System.out.println("0~9 사이의 난수 5개 발생");
		for(int i = 1; i<=5; i++) {
			int a = (int)(Math.random()*10); // 0~9까지의 난수 발생
			System.out.println(a);
		}
		
		System.out.println("1~10 사이의 난수 5개 발생");
		for(int i = 1; i<=5; i++) {
			int a = (int)(Math.random()*10+1); //1~10
			System.out.println(a);
		}
		
		System.out.println("1~100사이의 난수 5개 발생");
		for(int i = 1; i<= 5; i++) {
			int a = (int)(Math.random()*100+1);
			System.out.println(a);
		}
		
		System.out.println("0~99사이의 난수 5개 발생");
		for(int i = 1; i<= 5; i++) {
			int a = (int)(Math.random()*100);
			System.out.println(a);
		}
		
		System.out.println("0~99사이의 난수 5개 발생");
		for(int i = 1; i<= 5; i++) {
			int a = (int)(Math.random()*7);
			System.out.println(a);
		}
		
	}

}

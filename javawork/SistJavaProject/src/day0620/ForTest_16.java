package day0620;			//전체적으로 복습 필요

public class ForTest_16 { 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//1. 1~5까지 출력하시오
		
		for(int i = 1; i <= 5; i++)
		{
			System.out.println(i);
		}
		
		System.out.println("========================");
		
		for(int e =5; e>=1; e--)
		{
			System.out.println(e + " ");
		}
		
		System.out.println("========================");

		//0, 2, 4, 6, 8, 10		
		for(int o = 0; o<=10; o+=2)
		{
			System.out.println(o);
		}
		
		System.out.println("========================");
		
		//3,6,9,12,15
		for(int a = 3; a<=15; a+=3)
		{
			System.out.println(a);
		}
		
		System.out.println("========================");
		
		
		/*
		 	I love Java_0
		 	I love Java_1
		 	I love Java_2
		 	I love Java_3
		 */
		for(int java = 0; java<=3; java++)
		{
			System.out.println("I love Java_" + java);
		}
		
		
		
	}

}

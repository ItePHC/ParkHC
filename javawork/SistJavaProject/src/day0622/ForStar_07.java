package day0622;

public class ForStar_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("중첩(다중) for문으로 별모양 찍기");
		System.out.println();
		
		for(int i=1; i<=3; i++) //행 갯수
		{ 
			for(int j = 1; j<=7; j++) //열 갯수
			System.out.print("*");
			System.out.println();
		}
		System.out.println("======================================");

		for(int i=1; i<=5; i++) //행 갯수
		{ 
			for(int j = 1; j<=5; j++) //열 갯수
			{
				if(j >= i+1) {
					continue;
				}
				System.out.print("*");
			
			}
			System.out.println();
		}
		
		
		System.out.println("======================================");
		
		
		for(int i=1; i<=5; i++) //행 갯수
		{ 
			for(int j = 1; j<=i; j++) //열 갯수
			{
				System.out.print("*");
			
			}
			System.out.println();
		}
		
		System.out.println("======================================");
		
		for(int i = 1; i<=5; i++) //행 갯수
		{ 
			for(int j = 5; i <= j; j--) //열 갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
		System.out.println("======================================");
		
		for(int i = 1; i<=5; i++) //행 갯수
		{ 
			for(int j = 5; i <= j; j--) //열 갯수
			System.out.print("*");
			System.out.println();
		}
	
	}

}

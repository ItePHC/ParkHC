package day0621;

public class ExWhile_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// while for 비교
		
		// 10 9 8 7 6 5 4 3 2 1 0
		
		int i = 100;
		while(i >= 0) {
			System.out.print(i-- + " ");
		}
		
		System.out.println();
		
		//for
		
		for(int a=10; a>=0; a--) {
			System.out.print(a + " ");
		}
			
		System.out.println();
		
		for(i=10; i>=0; i--) {
			System.out.print(i + " " );
		}
		
		
	}

}
package PerPractice;

public class ForPractice_Tuple {
	
	public static void ForTuple() {
		for(int x = 1; x <= 10; x++) {
			for(int y = 10; y >= x; y--) {
				for(int z = 1; z >= (10-y); z++) {
					System.out.print("*");
					continue;
				}
			}
			System.out.println();
		}
		System.out.println();
	} 

	
	
	public static void star() { //3중 For문
		
		for (int i=0; i<=1;i++)  //문단 구성
		{
			for (int j=1; j<=9; j++ ) //곱해지는 수 1 2 3 4 5 6 7 8 9
			{
				for (int k=2;k<=5;k++) // 단 구성 2 3 4 5
				{
					System.out.printf("%4d * %d = %2d",i*4+k,j,(i*4+k)*j);
													//k->0 ->2345
													//k->1 ->6789

				}
				System.out.println();
			}
			System.out.println();

		}
	}

	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//ForTuple();
		star();
	}

}

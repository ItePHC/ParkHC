package day0624;

public class ArrMultiversal_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [][] arr = {
				{22, 33},
				{11, 21, 31},
				{10, 20, 30, 40},
				{100, 2, 3,}
		};
		
		System.out.println("총 행 갯수 : " + arr.length);
		System.out.println("0번 행의 열 갯수: " + arr[0].length);
		System.out.println("1번 행의 열 갯수: " + arr[1].length);
		System.out.println("2번 행의 열 갯수: " + arr[2].length);
		System.out.println("3번 행의 열 갯수: " + arr[3].length);
		
		//for문으로 출력
		for(int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.printf("%d, %d = %2d\t",i ,j , arr[i][j]);
			}
			System.out.println();
		}
		
	}

}

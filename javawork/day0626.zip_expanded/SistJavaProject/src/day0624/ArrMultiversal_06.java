package day0624;

public class ArrMultiversal_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [][] arr;
		arr = new int[2][3];	//2행 3열로 할당(row, column)
		
		//초기값
		arr[0][0] = 10;
		arr[0][1] = 20;
		arr[0][2] = 30;
		
		arr[1][0] = 5;
		arr[1][1] = 10;
		arr[1][2] = 20;
		
		System.out.println("행의 갯수 : " + arr.length);
		System.out.println("0행의 열 갯수 : " + arr[0].length);
		System.out.println("1행의 열 갯수 : " + arr[1].length);
		// System.out.println("2행의 열 갯수 : " + arr[2].length);
		
		System.out.println("***데이터 출력***");
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.printf("%d, %d = %2d\t",i ,j, arr[i][j]);
			}
			System.out.println();
		}
		System.out.println("2차원 배열에 값변경 후 다시 출력");	
	
		arr[0][1] = 1000;
		arr[1][0] = 2000;
		arr[1][2] = 3000;
		
		System.out.println("데이터 출력");
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.printf("%d, %d = %2d\t", i, j, arr[i][j]);
			}
			System.out.println();
		}
	
		
	}
	

}

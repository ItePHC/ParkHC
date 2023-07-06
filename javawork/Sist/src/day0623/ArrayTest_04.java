package day0623;

public class ArrayTest_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int [] arr1, arr2;
		arr1 = new int[3]; //메모리 할당
		arr2 = new int[5]; //할당만 되어도 값은 0으로 초기화
		
		//int[] arr1 = new int [3];
		//int arr2 [] = new int[5]; 
		
		//arr1 배열에 값을 넣는다
		arr1[0]=10;
		arr1[1]=5;
		arr1[2]=20;
				
		//배열의 갯수
		
		System.out.println(arr1.length); //3(0~2)
		System.out.println(arr2.length); //5(0~4)
		
		System.out.println();
		
		//arr1출력
		System.out.println(arr1[0]);
		System.out.println(arr1[1]);
		System.out.println(arr1[2]);
		
		System.out.println();
		
		System.out.println("for문으로 arr1을 출력_범위를 변수화");
		for(int i = 0; i < arr1.length; i++) {
			System.out.println(arr1[i]);
		}
		System.out.println();
		
		System.out.println("for문으로 arr2을 출력_범위를 변수화");
		for(int i = 0; i < arr2.length; i++) {
			System.out.println(arr2[i]);	
		}
		System.out.println();
		
		//foreach(배열변수자료형 (임의의 이름) : (변수명))
		System.out.println("for ~ each_arr1");
		for(int a1:arr1) {
			System.out.println(a1);
		}
		
		System.out.println();
		System.out.println("for ~ each_arr2");
		for(int a2 : arr2) {
			System.out.println(a2);
		}
		
		
	}

}

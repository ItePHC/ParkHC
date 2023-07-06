package day0628;

public class ExOverLoading_12 {

	public static int sum(int a, int b) {
		System.out.println("첫번째 함수 호출");
		return a + b;
	}
	
	public static double sum(int a, double b) {
		System.out.println("두번쨰 함수 호출");
		return a + b;
	}
	
	public static double sum(double a, int b) {
		System.out.println("세번쨰 함수 호출");
		return a + b;
	}
	
	public static double sum(double a, double b) {
		System.out.println("네번쨰 함수 호출");
		return a + b;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//인자 타입에 따라서 자동으로 중복함수가 호출된다
		
		System.out.println(sum(5, 5));
		System.out.println(sum(4, 5.3));
		System.out.println(sum(8.4, 5));
		System.out.println(sum(7.7, 5.44));
		
	}

}

package day0621;

public class ExForWhile_10 {

	public static void test1() {
		
		//for문으로 1부터 5까지 합 구하기
		
		int sum = 0;
		for (int i = 1; i<=5; i++) {
			
			sum += i;	
		}
		System.out.println("총 합계는 " + sum);
		
	}
	
	public static void test2() {
		//1에서 10까지의 홀수의 합 구하기 _ for 문 사용
		
		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			
			if(i % 2 ==0)
				continue;
			sum += i;
		}
		
		System.out.println("홀수의 합은 " + sum);
	}
	
	public static void test3() {
		//100까지의 합은 5050	 100은 변수로 처리해서 출력하시오. 
		int i;
		int sum = 0;
		for(i = 1; i <= 100; i++) {
			sum += i;
		}

		System.out.println((i-1) + "까지의 합 : " + sum);
		
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		test1();
		test2();
		test3();
		
		
		
	}

}

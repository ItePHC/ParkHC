package day0622;

public class QuizForWhile_01 {
	
	public static void quiz1() {
		//가로로 출력 for _ 1 2 3 4 5 그리고 다음줄에 종료라고 출력
		for (int i = 1; i<=5; i++) {
			System.out.print(i + " ");
		}
		System.out.println();
		System.out.print("종료");
		System.out.println();
	}
	
	public static void quiz2() {
		//가로로 출력, for , 1 2 4 5 7 8 10 출력
		for(int i = 0; i<=10; i++) {
			if(i % 3 ==0) 
				continue;
		System.out.print(i + " ");
		}
		System.out.println();
	}

	public static void quiz3() {
		//안녕 을 가로로 3번 출력하시오
		for(int i = 1; i<=3; i++) {
			System.out.print("안녕 ");
		}
		System.out.println();
	}
	
	public static void quiz4() {
		//1부터 10까지 중 짝수만 가로로 출력하세요
		for(int i = 1; i<=10; i++) {
			if(i % 2 == 1)
				continue;
			System.out.print(i + " ");
		}
		
	}
	
	public static void quiz5() {
		//1부터 10까지의 합은 55입니다 
		int sum = 0;
		int i;
		for(i = 0; i<=10; i++) {
			sum += i;
			
		}
		System.out.println("1부터 " + (i-1) + "까지의 합은 " + sum + "입니다.");	
	}
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		//quiz2();
		//quiz3();
		//quiz4();
		quiz5();
	}

}

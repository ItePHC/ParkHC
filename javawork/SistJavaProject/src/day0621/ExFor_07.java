package day0621;

public class ExFor_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//초기값이 조건에 안맞으면 한번도 반복안됨
		
		for(int i = 5; i <= 1; i++) {
			System.out.println(i);
		}
		
		int i;
		for(i = 1; i <= 10; i++ ) {
			System.out.print(i + " ");
		}
		System.out.println("\n빠져나온 후의 i값 : " + i);
		System.out.println();
		
		i = 10;
		for (; i <=50; i+=5) // 초기값을 반복문 바깥에서 주었을 경우 생략가능 단 ;은 써야한다
			System.out.println(i + " ");
		System.out.println("\n빠져 나온 후의 i값 : " +i);
	
		//Hello를 가로로 5번 반복하세요
		
	
		for (int n = 1; n <= 5; n++) {
			System.out.print("Hello ");
		}
		
		System.out.println();
		
		for (int n = 5; n >= 1; n--) {
			System.out.print("Hello ");
		}
		System.out.println("\n1부터 10까지의 숫자 중 짝수만 가로로 출력하기");
		
		
		for (int x= 1; x <= 10; x++) {
			if(x%2==0)
				//continue;
			System.out.print(x + " ");
		}
		
	}

}

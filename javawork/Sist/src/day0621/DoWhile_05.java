package day0621;

public class DoWhile_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int i = 1;
		System.out.println("while문 결과");
		//선조건 : 참일동안 반복, 조건 안맞으면 실행 X
		
		while(i<5) {
			//출력 후 증가
			System.out.println(i++);
			
		 // System.out.println(i);
	     // i++;
			
		}
		
		System.out.println("do-while문 결과");
		//후조건 : 조건 뒤에 온다. 조건이 안맞아도 한번 실행
 		i = 1;
		do {
			System.out.println(i++);
		}while(i>5);
	}

}
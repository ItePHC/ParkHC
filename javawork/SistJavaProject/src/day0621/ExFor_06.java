package day0621;

public class ExFor_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// for문
		// 1~10까지 가로로 출력
		// for문을 빠져나오면 1 증가
		
		for(int i = 1; i<=10; i++) {
			System.out.print(i + " ");
		}
		
		System.out.println();
		
		//10~1까지 가로출력
		
		for(int i = 10; i>=1; i--) {
			System.out.print(i + " ");
		}
		
		System.out.println();
		
		// 1~50 까지 출력, 3씩 증가 ex) 1 4 7 10 ...
		
		for(int i = 1; i<=50; i+=3) {
			System.out.print(i + " ");
		}
		 
		System.out.println();
		
		//continue
		//1~20까지 출력, 
		//1 2 3 4 6 7 8 9 11 12 13 14 16 17 18 19
		
		for(int i = 1; i<=20; i++) {
			if(i%5==0)
				continue; // 발동되는 문항을 제외하고 i++로 이동
			//  break; // break가 발동되는 순간 빠져나감
			System.out.print(i + " ");
		}
		
		System.out.println();
				
	}

}
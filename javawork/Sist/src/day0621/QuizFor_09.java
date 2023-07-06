package day0621;

public class QuizFor_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Q. 1 2 4 5 7 8 10 _ continue 이용해서 출력
		
		
		
		for (int i = 0; i<=10; i++) {
			if( i % 3 ==0)
				continue;
			System.out.print(i + " ");
		}
		System.out.println();
			
		/* 
		 Q. continue를 이용할 것
		 홀수값 : 1
		 홀수값 : 3
		 홀수값 : 5
		 홀수값 : 7
		 홀수값 : 9
		 */
		

		for (int i = 0; i<=10; i++) {
			if (i % 2 == 0)		//짝수는 출력 X
				continue;
			System.out.println("홀수값 : " + i);
		}
		
		
		// 1부터 100까지의 홀수의 합을 구하시오
		
		/*
		i = 0;
		int tot = i % 2;
		for (; i<=100; i++) {
			if (tot == 0)
				continue;
			System.out.println("1부터 100까지의 홀수의 합은 " + tot + "입니다");
		}
		*/
		
		int osum = 0; //홀수의 합
		int esum = 0; //짝수의 합
		for(int i = 1; i<=100; i++) {
			if (i % 2 == 0)
				osum += i;
			else
				esum += i;
		}
		System.out.println("1부터 100까지의 홀수의 합 : " + osum);
		System.out.println("1부터 100까지의 짝수의 합 : " + esum);
		
		//While(true)문을 이용해서 1~100 사이의 짝수 합 구하기
		
		
		// ** while문 복습하기 **
		int i = 0;
		int sum = 0;
		
/*		while(true) {	
			
			i++;
			if(i % 2 == 1)
				continue;
			
			sum += i;
			
			if(i>100)
				break;
			
		System.out.println("1~100 사이의 짝수 합은 " + sum);
		}
*/
		
		// int i = 0;
		// int sum = 0;
		
		
		
		
		
		while(true)
		{
			i++;
			
			if(i % 2==1)
				continue;
				
			if(i>100)
				break;
			
			sum += i;
		}
		System.out.println("1~100 사이의 짝수 합은 " + sum);
	}

}

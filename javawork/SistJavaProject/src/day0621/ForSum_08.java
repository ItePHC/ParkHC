package day0621;

public class ForSum_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//for문으로 합계 구하기'
		int sum = 0;//합계 구하는 변수 (무조건 0)
		
		for(int i=1; i<=10; i++)
		{
			sum += i; // sum = sum + i 합계변수에 i누적시킨다 
		}
		 
		System.out.println("1부터 10까지의 합은 " + sum + "입니다.");
		
		//while문으로도 합계 구하기
		
		int i = 1;
		sum = 0;
		
		while(i <= 1000) {
			sum = sum + i;
			i++;
		}
		System.out.println("1부터 1000까지의 합은 " + sum +"입니다.");
		
		//결과 출력시 1~10까지의 합은 55입니다.
		i = 1;
		int tot = 0;
		for (; i<=5000; i++) {
			tot += i;
		}
		System.out.println("1에서 " + (i-1) + "까지의 합은 " + tot);
		
		
	}

}

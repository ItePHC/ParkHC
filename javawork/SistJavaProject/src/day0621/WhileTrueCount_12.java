package day0621;

import java.util.Scanner;

public class WhileTrueCount_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 임의의 수를 입력해서 합계, 평균, 갯수 
		 단 0을 입력하면 while문을 빠져나가게 하자
		 */
		
		Scanner sc = new Scanner(System.in);
		int num, sum = 0; // 입력할 수, 합계
		int cnt = 0; // 갯수 
		double avg = 0; //평균
		
		while(true) {
			System.out.println("숫자입력 (종료 : 0)");
			num=sc.nextInt();
			
			if(num == 0)
				break;
			
			sum += num;
			cnt++;
		}
		System.out.println("입력한 수의 합 : " + sum);
		System.out.println("총 입력 갯수 : " + cnt);
		avg = (double)sum / cnt;
		System.out.println("입력한 수의 평균 : " + avg);
	}

}
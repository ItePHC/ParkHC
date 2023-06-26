package day0624;

import java.util.Arrays;
import java.util.Random;

public class LottoSort_03 {

	public static void main(String[] args) {
		
		int[] lotto = new int[6];
			
		for(int i = 0; i < lotto.length; i++) {	//--------------------- (1)
			// 1부터 45까지의 랜덤수 발생
			lotto[i]=(int)(Math.random()*45)+1;
			
			//중복처리
			for(int j=0; j<i; j++) {			//--------------------- (2)
				if(lotto[i] == lotto[j]) {
					i--;						//같은 번지에 다시 값을 구하기 위해서
					break;						// break를 통해 1로 이동(i++)
				}
					
			}
		}
		/*
		Arrays.sort(lotto);						//오름차순
		for(int i =0; i < lotto.length; i++)
		System.out.printf("%5d",lotto[i]);
		System.out.println();
		*/
		for(int i = 0; i <lotto.length-1; i++) {
			for(int j = i+1; j < lotto.length; j++) {
				if(lotto[i] > lotto[j]) {
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}	
				
			}
			System.out.print(lotto[i] + " ");
		}
	}
	
}

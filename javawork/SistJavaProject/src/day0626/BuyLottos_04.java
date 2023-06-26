package day0626;

import java.util.Arrays;
import java.util.Scanner;

public class BuyLottos_04 {
	public static void main(String[] args) {
	//몇장을 구입할건지 입력하여 여러장 출력
		Scanner sc = new Scanner(System.in);	
		int buy; //몇장인지, 얼마인지
		int[] lotto = new int[6];
		
		System.out.println("구입 할 금액을 입력해 주세요");
		buy = sc.nextInt();
		
		//예외조항
		if(buy < 1000) { 
			System.out.println("***금액이 부족합니다***");
			return; 	//if문에서 break같은 역
		}
		
		for(int n = 0; n < buy/1000; n++) {
			
			System.out.printf("%d회 : ",n+1);
			
		for(int i = 0; i < lotto.length; i++) {	//--------------------- (1)
			//1부터 45까지의 랜덤수 발생
			lotto[i]=(int)(Math.random()*45)+1;
		
			//중복처리
			for(int j=0; j<i; j++) {			//--------------------- (2)
				if(lotto[i] == lotto[j]) {
					i--;					//같은 번지에 다시 값을 구하기 위해서
					break;					// break를 통해 1로 이동(i++)
					}
				}
			}
		Arrays.sort(lotto);						//오름차순
		for(int i =0; i < lotto.length; i++) {
		System.out.printf("%5d",lotto[i]);
		}
		System.out.println();
		}
	
	
		/*
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
		*/
		}
	}


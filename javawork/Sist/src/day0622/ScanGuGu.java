package day0622;

import java.util.Scanner;

public class ScanGuGu {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 단을 입력해서 해당 단 출력하기
		// 0을 입력시 종료
		
		
		while(true) {
		int i;
		Scanner sc = new Scanner(System.in);
		System.out.println("단을 입력해주세요(0을 입력시 종료됩니다) ");
		i = sc.nextInt();
		
		if(i == 0) 
			break;
		
		if(i < 2 || i > 9) {
			System.out.println("2~9단 까지 입력 가능합니다");
			continue;
		}
		
		
		System.out.println("[" + i + "단]"); {
		for(int s = 1; s <= 9; s++) {
			//System.out.println(i + "*" + s + "=" + i * s);
			System.out.printf("%d * %d = %d\n",i, s, i*s);
			
				}
		System.out.println();
			}
		}
	}

}
package day0622;

public class GaroGuGu_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 가로방향으로 구구단을 출력하세요
		//[2단] [3단] [4단] [5단] ... [9단]
		
		System.out.println("[가로방향 구구단]");
		
		for(int dan = 2; dan<=9; dan++) {
			System.out.print("[" + dan + "단]\t");
		}
		System.out.println();
		for(int dan = 1; dan <= 9; dan++ ) {
			//System.out.print("[" + dan + "단] "); // [n단] 표시
				for(int su = 2; su <= 9; su++) {
				/*
					System.out.print(dan + "*" + su + "=" + dan*su + " ");
					if(su==9) 
					System.out.println();
				*/	
					System.out.print(su + "*" + dan + "=" + dan*su + " \t");
					
					
					}
				System.out.println();
				}
		}
}
package day0624;

import java.util.Scanner;

public class BingoGame_09 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int [][] pz = new int[3][3];
		int bingo = 0;
		
		while(true) {
			System.out.println("같은 숫자가 나오면 빙고");
			
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					pz[i][j] = (int)(Math.random()*3)+1;
				}	
				
			}
			
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					System.out.printf("%4d", pz[i][j]);
			
				}
				System.out.println();
			}
			
			for(int i = 0; i < pz.length; i++) {
					{
					if(pz[i][0] == pz[i][1] && pz[i][1] == pz[i][2])
						bingo++;
					
					if(pz[0][i] == pz[1][i] && pz[1][i] == pz[2][i]) 
						bingo++;
				}
					if(pz[0][0] == pz[1][1] && pz[1][1] == pz[2][2]) 
						bingo++;
					
					if(pz[0][2] == pz[1][1] && pz[1][1] == pz[2][0]) 
						bingo++;
				
				}
			if(bingo == 0) 
				System.out.println("빙고가 없습니다.");
			
			else
				System.out.println("빙고의 수는 " + bingo +"개 입니다.");
			
			
			System.out.println("엔터를 누르면 다음 난수가 나옵니다(Q를 누르면 종료됩니다)");
			String ans = sc.nextLine();
			
			bingo = 0;
			
			if(ans.equalsIgnoreCase("Q"))
				break;
			
			
			}
			/*
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					if(pz[i][0] == pz[i][1] && pz[i][1] == pz[i][2]) {
						bingo++;
					}
				}
			}
			
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					if(pz[0][i] == pz[1][i] && pz[1][i] == pz[2][i]) {
						bingo++;
					}
				}
			}
			
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					if(pz[0][0] == pz[1][1] && pz[1][1] == pz[2][2]) {
						bingo++;
					}
				}
			}
			
			for(int i = 0; i < pz.length; i++) {
				for(int j = 0; j < pz[i].length; j++) {
					if(pz[0][2] == pz[1][1] && pz[1][1] == pz[2][0]) {
						bingo++;
					}
				}
			}
			*/
			
			
			
			
			
		}
	}


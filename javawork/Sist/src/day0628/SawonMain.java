package day0628;

import java.util.Scanner;

public class SawonMain {

	public static void getSawon(Sawon[] sawon) {
		
		//제목
		Sawon.getTitle();
		
		for(Sawon s:sawon) {
			System.out.println(s.getSawonName() + "\t" + s.getPay() + "\t" + s.getFamsu() + "\t" + s.getTime() +
			"\t" + s.getFamilySudang() + "\t" + s.getTimeSudang() + "\t" + s.getTotalPay());
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);	
		int inwon; //몇명인지 입력
		
		Sawon [] sawon;
		
		System.out.println("입력할 직원수는?");
		inwon = Integer.parseInt(sc.nextLine());	
		
		//배열할당
		sawon = new Sawon[inwon];
				
		//인원수만큼 데이터 입력
		for(int i = 0; i < sawon.length; i++) {		//inwon = sawon.length
			//sawon생성
			sawon[i] = new Sawon();
			
			System.out.println("사원명?");
			String name = sc.nextLine();
			System.out.println("급여?");
			int pay = Integer.parseInt(sc.nextLine());
			System.out.println("가족수?");
			int fs = Integer.parseInt(sc.nextLine());
			System.out.println("초과시간?");
			int ts = Integer.parseInt(sc.nextLine());
			
			//setter로 sawon클래스에 데이터를 넣기
			sawon[i].setSawonName(name);
			sawon[i].setPay(pay);
			sawon[i].setFamsu(fs);
			sawon[i].setTime(ts);
			
			
		}
	
		getSawon(sawon);
		
	}
	
	

}

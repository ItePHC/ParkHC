package day0628;
/*
이름 급여 가족수 시간수  						 //입력
이름 급여 가족수 초과시간 가족수당 시간수당 총급여		 //출력
*/
public class Sawon {
	private String sawonName;
	private int pay;
	private int famsu;
	private int time;

	
	public String getSawonName() {
		return sawonName;
	}
	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getFamsu() {
		return famsu;
	}
	public void setFamsu(int famsu) {
		this.famsu = famsu;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	
	
	// 가족수당 ... 가족당 5만원 (최대 4명, 4명 초과시 최대 20만)
	public int getFamilySudang() {
		int n = 0;
		
		if(famsu >= 4)
			n = 200000;
		else 
			n = famsu * 50000;
		
		return n;
	}
	
	
	// 시간 외 수당 ... 시간당 3만원 (10시간 초과시 최대 30만원)
	public int getTimeSudang() {
		int n = 0;
		
		if(time >= 10)
			n = 300000;
		else
			n = time * 30000;
		
		return n;
		}	
	
	
	// 총급여 :  
	public int getTotalPay() {
		int s = pay + getFamilySudang() + getTimeSudang();
			
		return s;		
	}
	
	
	//제목
	public static void getTitle() {
		System.out.println("*** 우리회사 직원 급여현황***");
		System.out.println();
		System.out.println("사원명\t급여\t가족수\t초과시간\t가족수당\t시간외수당\t총급여");
		System.out.println("===========================================================================");
		
		
		
	} 
	
	
}

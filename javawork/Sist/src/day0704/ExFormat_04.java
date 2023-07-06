package day0704;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExFormat_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Date date = new Date();
		System.out.println(date);
		
		//날짜 시간을 원하는 양식에 맞게 출력
		//HH : 24시간을 표현 / MM : 월 / mm : 분
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println(sdf1.format(date));
		
		System.out.println();
		//a : 오전 / 오후 표시		hh : 12시간
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd a hh:mm");
		System.out.println(sdf2.format(date));
		
		System.out.println();
		//EEE : 요일 짧게(화) 			EEEE : 요일 길게(화요일)
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd a hh:mm EEEE");
		System.out.println(sdf3.format(date));
		
		System.out.println();
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분 EEEE");
		System.out.println(sdf4.format(date));
		
		System.out.println();
		SimpleDateFormat sdf5 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 EEEE");
		System.out.println(sdf5.format(date));
		
		
		//숫자, 돈, 컴마 등등
		int money = 6785420;
		double num = 34767.45123;
		
		NumberFormat nf1 = NumberFormat.getCurrencyInstance();		//화폐단위 컴마 제공
		System.out.println(nf1.format(money));					
		
		NumberFormat nf2 = NumberFormat.getInstance();				//컴마 제공(화폐단위X)	
		System.out.println(nf2.format(num));
		System.out.println(nf2.format(money));
	}

}

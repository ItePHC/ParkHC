package day0703;

import java.util.Date;

public class Nullpoint_02 {						//생성하지않고 클래스의 메서드 호출
	
	//NullpointException - 생성하지 않고 클래스의 메서드를 호출하는 경우
	Date date;
	
	public void writeday() {
		
		int y, m, d;
		
		try {
		y = date.getYear()-1900;
		m = date.getMonth()+1;
		d = date.getDate();
		
		System.out.println(y + "년 " + m + "월 " + d + "일 입니다");
		
		}catch (NullPointerException e) {
			System.out.println("객체생성을 안했어요" + e.getMessage());
			
		}
	} 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Nullpoint_02 np = new Nullpoint_02();
		np.writeday();
		System.out.println("***정상종료***");
		
	}

}

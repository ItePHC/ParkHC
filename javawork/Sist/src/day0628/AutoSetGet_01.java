package day0628;

class MyDate {
	
	//인스턴스 변수  / static이 붙지 않으면 인스턴스 변수
	private int year;
	private int month;
	private int day;
	
	// 디폴트 생성자가 숨어있다... 명시적 생성자를 만들면 오류 해결
	public MyDate() {
		
	}
	
	
	// 명시적 생성자
	public MyDate(int y, int m, int d) {
		year = y;
		month = m;
		day = d;
	}
	
	// void : 완성형일때만 사용
	
	
	// setter, getter....    source에서 generate setter and getter 로 편하게 만들수있다
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}

/////////////////////////////////////////
public class AutoSetGet_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//객체생성
		MyDate date = new MyDate();
		
		date.setYear(2023);
		date.setMonth(6);
		date.setDay(28);
		
		System.out.println(date.getYear() + "년" + date.getMonth() + "월" + date.getDay()+"일"); 
		
		//명시적 생성
		MyDate date1 = new MyDate(2020, 8, 10);
		System.out.println(date1.getYear()+ "년" + date1.getMonth() + "월" + date1.getDay()+"일");
		
		
	}

}

package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class OperTest_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//삼항연산자로 조건 12... 태어난 연도로 띠 구해보기 
		//로직에서의 시작은 언제나 원숭이 띠
		
		Scanner sc = new Scanner(System.in);
		int myYear, age;
		String name, ddi;
		
		
		
		
		System.out.print("이름 입력 : ");
		name = sc.nextLine();
		System.out.print("태어난 연도 입력 : ");
		myYear=sc.nextInt();
		
		Calendar cal = Calendar.getInstance() ;
		age = cal.get(cal.YEAR) - myYear;
		
		//로직에서 사용순서는 원숭이부터
		
		ddi = myYear % 12 == 0? "원숭이 띠" :
			myYear % 12 == 1? "닭 띠" :
			myYear % 12 == 2? "개 띠" :
			myYear % 12 == 3? "돼지 띠" :
			myYear % 12 == 4? "쥐 띠" :
			myYear % 12 == 5? "소 띠" :
			myYear % 12 == 6? "호랑이 띠" :
			myYear % 12 == 7? "토끼 띠" :
			myYear % 12 == 8? "용 띠" :
			myYear % 12 == 9? "뱀 띠" :
			myYear % 12 == 10? "말 띠" : "양 띠";
		
		System.out.println("**나이와 띠 구하기**");
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age + "세");
		System.out.println("띠 : " + ddi );
		
		
		
		
		
		
		
		
		
	}

}
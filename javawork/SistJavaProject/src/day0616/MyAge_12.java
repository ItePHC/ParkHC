package day0616;

import java.io.ObjectInputStream.GetField;
import java.time.Year;
import java.util.Calendar;

public class MyAge_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 매개변수 args에서 실행시 이름과 태어난 연도를 보낸 후 출력하세요(name, MyBirth)
		// 이름 : 박희찬
		// 태어난 연도 : 2000년도
		// 나이 : 22
		
		//현재년도는 Calendar import하여 구할수 있다
		//1. import
		Calendar cal = Calendar.getInstance();
		
		//2. 변수
		String name = args[0];
		int MyBirth = Integer.parseInt(args[1]);
		
		// int curYear = calendar.get(calendar.YEAR); //현재년도
		
		//3. 계산
		int age = cal.get(cal.YEAR) - MyBirth;
		
		
		//4. 출력
		
			
		System.out.println("이름 : " + name);
		System.out.println("태어난 연도 : " + MyBirth + "년 생");
		System.out.println("나이 : " + age + "세");
		
		
		
		
	}

}

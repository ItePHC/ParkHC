package day0627;

import day0623.Random_01;

public class ExObject_01 {					
	
	//객체지향
	String name; //인스턴스변수..일반 인스턴스 멤버변수는 객체 생성 후 각각 다른 값을 가질수 있다.
	static final String MESSAGE="Happy Day";  //final이 상수임을 고정함	***final이 들어가면 메세지 수정X***
	//Static 멤버변수는 주로 상수로 선언할 떄 사용하며 인스턴스 변수 없이 클래스명으로 접근가능하다.
	//여러 객체가 같은값을 가져야 할 경우 주로 Static으로 선언한다 
	
	
	
	public static void main(String[] args) {	
		// TODO Auto-generated method stub
		
		System.out.println("static변수는 new로 생성없이 호출가능");
		System.out.println(ExObject_01.MESSAGE);
		System.out.println(MESSAGE);
		// MESSAGE = "Nice Day!!!";  /	final이라서 값 변경 X
		
		//클래스명, 참조변수명, new 클래스 명();
		ExObject_01 ex1 = new ExObject_01();	// 객체생성
		System.out.println(ex1.name);	// null
		ex1.name = "김철수";				// null을 김철수로 변경
		System.out.println(ex1.name);
		
		ExObject_01 ex2 = new ExObject_01();
		ex2.name = "홍길동";
		System.out.println(ex2.name);
		
		ExObject_01 P = new ExObject_01();
		P.name = "박희찬";
		System.out.println(P.name);
		
		System.out.println("다 같이 사용하는 메세지 : " + MESSAGE);
		
	}

}

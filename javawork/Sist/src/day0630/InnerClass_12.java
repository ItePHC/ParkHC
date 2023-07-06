package day0630;

import day0630.Outer.Inner;

class Outer {
	String name = "이민규";
	int age = 22;
	
	class Inner {
		
		//내부에서 외부클래스 사용가능
		public void disp() {
			System.out.println("***Inner 내부클래스***");
			System.out.println("이름 : " + name + ", 나이 : " + age);
			System.out.println();
		}
	}
	class Inner2 {
		//내부에서 외부클래스 사용가능
		public void disp2() {
			System.out.println("***Inner2 내부클래스***");
			System.out.println("이름 : " + name + ", 나이 : " + age);
			System.out.println();
		}
	}
	
	//외부의 메서드 추가
	public void write() {
		Inner in1 = new Inner();
		in1.disp();
		
		Inner2 in2 = new Inner2();
		in2.disp2();
	}
}

public class InnerClass_12 {
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Outer outer = new Outer();
		outer.write();
		
		System.out.println("==============================");
		
		System.out.println("다른 클래스를 통하지 않고 직접 내부 클래스 메서드 호출하려면?");
		
		Outer.Inner in1 = new Outer().new Inner();
		in1.disp();
		
		Outer.Inner2 in2 = outer.new Inner2();
		in2.disp2();
		
	}

}

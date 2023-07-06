package day0629;

import day0629_1.SuperObj;

public class SubObj_03 extends SuperObj{				//extends : 상속받음을 의미		//	"SuperObj" 에서 "subObj_03"로 상속 (~는 ~에서 상속받는다)	

	public SubObj_03(String name, int age, String addr) {
		super(name, age);		//반드시 첫줄에 부모생성자를 호출해야함
		this.addr = addr;		// 상속받기 전에 생성자 발생시 오류 발생 상속하는 문은 반드시 
	}
	
	public void write() {
		System.out.println("이름 : " + this.name);	//super.name이여야 하나 상속받아서 this.name사용가능
		System.out.println("나이 : " + this.age);
		System.out.println("주소 : " + this.addr);
	}
	String addr;
	
	
}

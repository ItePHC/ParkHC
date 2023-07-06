package day0629_1;
/*
	부모 클래스가 다른 패키지에 있을경우 protected, public 변수는 접근이 가능하다
	같은 패키지인 경우에는 private만 뺴고 모두 접근가능
*/
public class SuperObj {

	protected String name;
	protected int age;
	//String A   => 클래스가 달라서 불가능
	
	public SuperObj(String name, int age) {
		this.name = name;
		this.age = age;
	}

}

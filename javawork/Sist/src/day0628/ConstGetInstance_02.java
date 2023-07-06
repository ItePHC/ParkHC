package day0628;

class Test {

	public Test() {
		System.out.println("디폴트 생성자");
	}
	
	//생성자 대신 인스턴스를 반환해주는 메서드
	public static Test getInstance() {		//인스턴스를 반환할떄 어떤 인스턴스를 반환하는지 설명하는? 목적으로 (클래스 명)+(매서드 명)순서이다 
		return new Test();
	}
	//일반메서드
	public void writeMessage() {
		System.out.println("안녕??");
	}
	
	
}

public class ConstGetInstance_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Test t1 = new Test();
		t1.writeMessage();
		////////////////////////////////////////////
		Test t2 = Test.getInstance();
		t2.writeMessage();				//Calendar 원리
		
	}

}

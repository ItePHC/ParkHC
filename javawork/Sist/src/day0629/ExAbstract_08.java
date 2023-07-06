package day0629;
/*
추상클래스는 new로 생성 못함
추상메서드가 하나라도 존재하는 클래스를 추상 클래스라고 한다
추상클래스 - 일반메서드, 추상메서드 둘다 존재 가능
*/
abstract class Fruit {									//추상클래스여서 abstract를 클래스 앞에 붙여줘야 함
	static final String MESSAGE = "오늘은 비가 많이 오는 날"; 	//상수는 주로 대문자

	//일반메서드
	public void getTitle() {
		System.out.println("우리는 추상클래스 공부중!!!");
	}

	//추상메서드(미완의 메서드... 선언문만 있고 구현부인 몸통이 없다)
	abstract public void showMessage();					//오버라이딩	
}

/////////////////////////////////////////////////////////
class Apple extends Fruit {

	@Override
	public void showMessage() {
		System.out.println("Apple_Message");
		System.out.println(Fruit.MESSAGE);
	}
	
}
/////////////////////////////////////////////////////////
class Banana extends Fruit{

	@Override
	public void showMessage() {
		System.out.println("Banana_Message");
		System.out.println(Fruit.MESSAGE);
	}
	
}
/////////////////////////////////////////////////////////
class Orange extends Fruit{

	@Override
	public void showMessage() {
		System.out.println("Orange_Message");
		System.out.println(Fruit.MESSAGE);
	}
	
}
/////////////////////////////////////////////////////////
public class ExAbstract_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//일반생성_메서드 호출
		Apple apple = new Apple();
		Banana banana = new Banana();
		Orange orange = new Orange();
		
		apple.showMessage();
		banana.showMessage();
		orange.showMessage();
		
		System.out.println("--------------------------");
		System.out.println("--------------------------");
		
		//다형성
		//다형성은 하나의 변수로 여러가지 일을 처리할때 이용
		//부모클래스명 변수명 = new 자식클래스명(); 형식으로 구성
		Fruit fruit;
		fruit = new Apple();
		fruit.showMessage();
		
		fruit = new Banana();
		fruit.showMessage();
		
		fruit = new Orange();
		fruit.showMessage();
		
		fruit.getTitle();
	}
	
		
		

}

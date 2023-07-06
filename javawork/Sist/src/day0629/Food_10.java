package day0629;

// class가 class : extends						클래스가 클래스를 받을떄 : extends
// class가 interface : implements			****클래스가 인터페이스를 받을떄 : implements
// inter가 inter : extends						인터페이스가 인터페이스를 받을떄 : extends
// implements는 다중 구현이 가능하다




public class Food_10 implements FoodShop_10 {

	@Override
	public void orger() {
		// TODO Auto-generated method stub
		System.out.println(SHOPNAME);
		// SHOPNAME = "돈까스집";
		System.out.println("음식을 주문합니다");
	}

	@Override
	public void delivery() {
		// TODO Auto-generated method stub
		System.out.println(SHOPNAME);
		System.out.println("음식을 배달합니다");
	}
}

	
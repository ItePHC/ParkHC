package day0629;

public interface FoodShop_10 {

	//인터페이스는 상수와 추상메서드만 선언이 가능하다
	String SHOPNAME = "보슬보슬"; //상수
								//상수 앞에는 final이 와야하나 interface 안에서는 상수만 담을수 있기 때문에 final을 생략해도 된다
	public void orger();		// abstract 생략
	public void delivery();		
	
}

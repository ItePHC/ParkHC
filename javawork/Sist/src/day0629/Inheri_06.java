package day0629;
/*
Shop클래스

sangpum 상품명
su 개수

인자있는 생성자
출력메서드 writeShop
-상품과 개수를 출력
=======================
MyCart

price 가격

Shop를 상속받아 생성자 완성
writeShop매서드 오버라이드 해서 가격 추가
==============================
메인에서 출력
상품 개수 가격 모두 있는 메서드 출력

*/
class info {
	String sangpum;	//상품명
	int su;			//개수
	
	public info(String sang, int su) {
		this.sangpum = sang;
		this.su = su;
	}
	
	public void writeShop() {
		System.out.println("상품명 : " + sangpum);
		System.out.println("개수 : " + su) ;
	}
}

/////////////////////////////////////////////

class MyCart extends info {
	int Price;
	public MyCart(String sang, int su, int Price) {
		super(sang, su);
		this.Price = Price;
	}
	
	@Override
	public void writeShop() {
		System.out.println("상품정보");
		super.writeShop();
		System.out.println("가격 : " + Price);
		System.out.println();
	}
	
	
}



//////////////////////////////////////////////
public class Inheri_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyCart c1 = new MyCart("핸드폰", 2, 800000);
		c1.writeShop();
	}

}

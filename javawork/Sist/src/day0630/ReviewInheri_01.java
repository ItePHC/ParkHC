package day0630;

class Market {
	
	private String sangpum;
	private int su;
	
	public Market() {
		sangpum = "초코파이";
		su = 10;
	}
	
	public Market(String sangpun, int su) {
		this.sangpum = sangpun;
		this.su = su;
	}
	
	public void getMarket() {
		System.out.println("상품명 : " + sangpum);
		System.out.println("수량 : " + su);
	}
		
}

class MyMarket extends Market {
	private int price;
	
	public MyMarket() {
		price = 5000;
	}
	
	public MyMarket(String samgpum, int su, int price) {
		super();
		this.price = price;
	}
	
	@Override
	public void getMarket() {
		// TODO Auto-generated method stub
		super.getMarket();
		System.out.println("단가 : " + price);
	}
}



public class ReviewInheri_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//디폴트 생성자
		MyMarket m1 = new MyMarket();
		m1.getMarket();
		System.out.println();
		
		//명시적 생성자
		MyMarket m2 = new MyMarket("오렌지", 20, 4500);
		m2.getMarket();
		System.out.println();
	}

}

package day0629;

class Starbucks{
	
	private String store;	//지점
	private String menu;	//메뉴
	private String MD;		//텀블러 등등 기타 굿즈
	
	public void setOrder(String store, String menu, String MD) {
		this.store = store;
		this.menu = menu;
		this.MD = MD;
 
	}
	
	public void getOrder() {
		System.out.println("스타벅스 " + store + "점에 왔습니다.");
		System.out.println(menu + "를 주문합니다");
		System.out.println("추가로 " + MD + "를 구매합니다.");
		
		
		// if(MD = null)일때 추가로 주문하는 것은 없습니다 출력
			
	} 
	
}



public class ReviewObject_02 {

	/*
	나는 스타벅스 코엑스 매장에 왔습니다
	아이스 아메리카노를 주문합니다
	우산을 샀어요
	*/
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Starbucks order1 = new Starbucks();
		
		
		System.out.println("주문서");
		order1.setOrder("코엑스", "아이스 아메리카노", "우산");
		order1.getOrder();
		System.out.println();
		
		Starbucks order2 = new Starbucks();
		order2.setOrder("역삼포스코", "아이스 카페모카", null);
		order2.getOrder();
		
		
	}

}

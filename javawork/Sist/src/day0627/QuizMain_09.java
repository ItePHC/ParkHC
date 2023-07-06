package day0627;

public class QuizMain_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		
		System.out.println("\t[쇼핑 목록]\n쇼핑장소 : " + Quiz_09.SHOPNAME ); 
		
		Quiz_09 stock1 = new Quiz_09();
		stock1.setName("손선풍기");
		stock1.setPrice(25000);
		
		String name = stock1.getName();
		int price = stock1.getPrice();
		System.out.println("상품명 : " + name);
		System.out.println("가격 : " + price + "원");
		
		System.out.println("====================================================");
		System.out.println("\t[쇼핑 목록]\n쇼핑장소 : " + Quiz_09.SHOPNAME ); 
		
		Quiz_09 stock2 = new Quiz_09();
		
		stock2.setName("핸드폰충전기");
		stock2.setPrice(30000);
		System.out.println("상품명 : " + stock2.getName());
		System.out.println("가격 : " + stock2.getPrice() + "원");
		
		System.out.println("====================================================");
		System.out.println("\t[쇼핑 목록]\n쇼핑장소 : " + Quiz_09.SHOPNAME ); 
		
		Quiz_09 stock3 = new Quiz_09();
		
		stock3.setName("이어폰");
		stock3.setPrice(70000);
		System.out.println("상품명 : " + stock3.getName());
		System.out.println("가격 : " + stock3.getPrice() + "원");
	}

}

package day0627;

public class Quiz_09 {

	/*
		멤버는 private, 디폴트생성자
		
		[쇼핑 목록]
		쇼핑장소 : 이마트
		
		목록 1 
		상품명 : 손선풍기
		가격 : 25000원
		
		목록 2
		상품명 : 핸드폰 충전기
		가격 : 30000원
		
		목록 3
		상품명 : 이어폰
		가격 : 70000원
		
	*/
	
	//변수선언	
	static String SHOPNAME = "이마트";
	private String name;	//null
	private int price;		//0
	
		//set메서드
		public void setName(String name) {
			this.name=name;
		}
		public void setPrice(int price) {
			this.price=price;
		}
		
		//get메서드
		public String getName() {
			return name;
		}
		public int getPrice() {
			return price;
		}

	}

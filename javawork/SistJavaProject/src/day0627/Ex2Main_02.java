package day0627;


public class Ex2Main_02 {							//public은 단 1개여야만 한다. class는 여려개여도 됨

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		System.out.println();
		
		//클래스변수
		Ex2Object_02.width = 10;
		Ex2Object_02.height = 20;
		
		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		System.out.println();
		
		//인스턴스 생성 후 변수 호출가능
		Ex2Object_02 card1 = new Ex2Object_02();
		
		System.out.println(card1.Kind); //null
		System.out.println(card1.number); // 0
		System.out.println();
		card1.Kind = "Heart";
		card1.number = 4;
		
		System.out.println(card1.Kind); 
		System.out.println(card1.number); 
		System.out.println();
		//인스턴스 변수 생성 후 변경 후 출력
		
		Ex2Object_02 card = new Ex2Object_02();
		card.Kind = "Heart " + "Clover " + "Diamond " + "Spade ";
		card.number = 7;
		
		System.out.println(card.Kind); 
		System.out.println(card.number);
		
	}

}

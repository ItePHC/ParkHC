package day0627;

public class QuizMain_10 {

	public static void main(String[] args) {
		/*
			상품입고
			=====================
			입고된 상점 : 롯데마트
			=====================
			상품명 : 딸기
			가격 : 10000원
			수량 : 5팩
			=====================
			상품명 : 초코파이
			가격 : 5000원
			수량 : 10상자
			=====================
			상품명 : 요거트
			가격 : 2500원
			수량 : 50팩
		*/
		/*
		Quiz_10 p1 = new Quiz_10("딸기", 5, 10000);
		String name = p1.getname();
		int su = p1.getsu();
		int dan = p1.getdan();
		
		System.out.println("--------------------------------");
		System.out.println("\t[상품 입고]");
		System.out.println("--------------------------------");
		System.out.println("\t[" + Quiz_10.SHOPNAME + "]");
		System.out.println("--------------------------------");
		System.out.println("상품명 : " + name);
		System.out.println("수량 : " + su);
		System.out.println("단가 : " + dan);
		System.out.println();
		System.out.println();
		
		Quiz_10 p2 = new Quiz_10("초코파이", 10, 5000);
		System.out.println("--------------------------------");
		System.out.println("\t[상품 입고]");
		System.out.println("--------------------------------");
		System.out.println("\t[" + Quiz_10.SHOPNAME + "]");
		System.out.println("--------------------------------");
		System.out.println("상품명 : " + p2.getname());
		System.out.println("수량 : " + p2.getsu());
		System.out.println("단가 : " + p2.getdan());
		System.out.println();
		System.out.println();
		
		Quiz_10 p3 = new Quiz_10("요거트", 100, 2500);
		System.out.println("--------------------------------");
		System.out.println("\t[상품 입고]");
		System.out.println("--------------------------------");
		System.out.println("\t[" + Quiz_10.SHOPNAME + "]");
		System.out.println("--------------------------------");
		System.out.println("상품명 : " + p3.getname()+"요거트");
		System.out.println("수량 : " + p3.getsu());
		System.out.println("단가 : " + p3.getdan());
		System.out.println();
		System.out.println();
		*/
		
		//private선언시
		
		Quiz_10 p1 = new Quiz_10() ;
		p1.setName("딸기");
		p1.setSu(5);
		p1.setDan(10000);
		String name = p1.getname();
		int su = p1.getsu();
		int dan = p1.getdan();
		
		System.out.println("--------------------------------");
		System.out.println("\t[상품 입고]");
		System.out.println();
		System.out.println("\t[" + Quiz_10.SHOPNAME + "]");
		System.out.println("--------------------------------");
		System.out.println("상품명 : " + name);
		System.out.println("수량 : " + su);
		System.out.println("단가 : " + dan);
	
		Quiz_10 p2 = new Quiz_10();
		p2.setName("초코파이");
		p2.setSu(10);
		p2.setDan(5000);
		
		System.out.println("--------------------------------");
		System.out.println("\t[상품 입고]");
		System.out.println();
		System.out.println("\t[" + Quiz_10.SHOPNAME + "]");
		System.out.println("--------------------------------");
		System.out.println("상품명 : " + p2.getname());
		System.out.println("수량 : " + p2.getsu());
		System.out.println("단가 : " + p2.getdan());
		
	}

}

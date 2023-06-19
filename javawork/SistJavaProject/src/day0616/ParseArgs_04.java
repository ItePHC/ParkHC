package day0616;

public class ParseArgs_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * 변수명 : sangName, su, dan, total
		 * 1. 변수선언
		 * 2. 계산
		 * 3. 출력
		 * 
		 * [상품정보]
		 * 상품명 : 갤럭시폴드
		 * 수량 : 5개
		 * 단가 : 800000
		 * 총 금액 : 4000000 
		 * 
		 */
		
		String name = args[0];
		
		int su = Integer.parseInt(args[1]);
		int dan = Integer.parseInt(args[2]);
		int total = su*dan;
		
		
		System.out.println("[상품정보]");
		System.out.println("상품명 : " + name);
		System.out.println("상품명 : " + args[0]);
		System.out.println("수량 : " + su + "개");
		System.out.println("단가 : " + dan + "원");
		System.out.println("총 금액 : " + total + "원");
		
		
		
		
	}

}

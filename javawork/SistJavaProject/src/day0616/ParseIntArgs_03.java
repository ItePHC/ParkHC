package day0616;

public class ParseIntArgs_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/* [결과출력]
		 * 내 이름은 김영환 
		 * 자바 점수는 88
		 * 오라클 점수는 77
		 * 두 과목의 합계는 165점 입니다.
		 */
	
	String name = args[0];
	int Java = Integer.parseInt(args[1]);
	int Oracle = Integer.parseInt(args[2]);

	System.out.println("[결과출력]");
	System.out.println("내 이름은 " + name);
	System.out.println("자바 점수는 " + Java + "입니다.");
	System.out.println("오라클 점수는 " + Oracle + "입니다.");
	System.out.println("두 과목의 합계는 " + (Java + Oracle));
	System.out.println("=======================");
	
	
	
	int Su1 = Integer.parseInt(args[1]);
	int Su2 = Integer.parseInt(args[2]);
	
	System.out.println("[결과출력]");
	System.out.println("내 이름은 " + args[0]);
	System.out.println("자바 점수는 " + args[1] + "입니다.");
	System.out.println("오라클 점수는 " + args[2] + "입니다.");
	System.out.println("두 과목의 합계는 " + (Su1 + Su2));
	
		
		
	}

}

package day0616;

public class QuizDataType_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//매개변수를 이용하여 출력해보세요
		/* 	
		 *  [시험결과]
		 *  Java=88, Jsp=77, Spring=99
		 *  총점 : 264 점
		 *  평균 : 88.00 점
		 */

		
		int Java = Integer.parseInt(args[0]);
		int Jsp = Integer.parseInt(args[1]);
		int Spring = Integer.parseInt(args[2]);
		
		int Sum = Java + Jsp + Spring;
		
		double avg1 = Sum/3; // 결과가 무조건 int
		double avg2 = (double)Sum/3; //결과가 무조건 double
		
		System.out.println("[시험결과]");
		System.out.printf("Java = %d, Jsp = %d, Spring = %d\n", Java, Jsp, Spring);
		System.out.printf("총점 : %d 점\n", Sum);
		System.out.printf("평균 : %.2f 점", avg1);
		
		
	}

}
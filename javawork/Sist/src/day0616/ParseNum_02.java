package day0616;

public class ParseNum_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String 타입을 int타입으로 변경하려면
		//Integer.parseInt("10"); 문자열 10이 정수 10로 반환
		//Double.parseDouble("12.23"); 문자열 12.23이 실수타입의 12.23으로 반환
		
		
	String num1 = "100";
	String num2 = "17";
	
	
	
	System.out.println("두 수 더하기 : " + (num1 + num2) );
	
	//문자열 num1,num2를 정수타입 int로 변환 후 계산
	
	int su1 = Integer.parseInt(num1);
	int su2 = Integer.parseInt(num2);
	
	System.out.println("변환 후 두 수 더하기 : " + (su1 + su2) );
	
	System.out.println("변환 후 두 수 빼기 : " + (su1 - su2) );
	System.out.println("변환 후 두 수 곱하기 : " + (su1 * su2) );
	System.out.println("변환 후 두 수 나누기 " + (su1 / su2) ); //정수형끼리 연산시 결과도 정수형
	System.out.println("변환 후 두 수 나머지 구하기 : " + (su1 % su2) );
	
	}

}
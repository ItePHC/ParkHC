package day0616;

public class OperTest_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//기본 자료형_8개
		//1. 논리형_true,false
		
		boolean b=false;
		//2. 문자형
		//반드시 하나의 문자 16비트 유니코드값 표현
		//자바에서 char 문자 하나 2바이트 
		//기본적으로는 정수형, 아스키코드로 변환
		char ch='A';
		
		//3.정수형
		byte a=-128; //1바이트 : -128 ~ 127까지 가능
		short s= 32000; //16bit
		int c = 6700000; //32bit
		long num = 100L; //64bit, 뒤에 L 또는 l을 붙여야 long

		//실수형
		double d = 42356.14526; //64bit
		float f = 3.1234568f; //32bit
		
		//int, float 는 둥다 똑같이 32bit를 사용하지만 기본적으로 실수형이 정수형보다 큰 타입으로 처리한다 
	
		//출력
		System.out.println("bool = " +b);
		System.out.println("not bool = " + !b);
		System.out.println("ch = " + ch); // 65=A
		System.out.println("ch = " + (ch+1)); //66
		System.out.println("ch = " + (char)(ch+1)); //B [아스키코드에서 ch보다 1만큼 더 큰 문자]
		System.out.println("d = " +d); // 정밀도 15자리까지 가능
		System.out.println("f = " +f); // 정밀도 8자리까지 가능
		
		
		//printf %f: 실수
		//전체 자리수 10자리 소수점 2자리
		
		System.out.printf("d=%10.2f\n",d);
		// 소수점 한자리

		System.out.printf("d=%.1f",d);
		
	}

}

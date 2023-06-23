package day0623;

public class ArrStr_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//문자열 배열 str1, str2 .... 선언과 동시에 초기화
		
		String [] str1 = {"김밥", "피자", "스파게티", "햄버거", "짜장면"};
		String [] str2 = new String[5]; //5개의 문자열이 들어가도록 메모리 할당, null로 초기화
		
		str2[0] = "빨강";
		str2[2] = "노랑";
		str2[4] = "파랑";
	
		//str1을 변수 i를 이용해서 출력
		//음식1 : 김밥
		//음식2 : 피자
		System.out.println("str1출력 1");
		
		for(int i = 0; i < str1.length; i++) {
			System.out.println("음식" + (i+1) + ":" + str1[i]);
		}
		
		System.out.println();
		System.out.println("str1출력 2");
		for (String f : str1) {
			System.out.print(f + "\t");
		}
		
		System.out.println();
		System.out.println("str2출력 1");
		
		for(int i = 0; i < str2.length; i++) {
			System.out.println((i+1)+ "번째 색 : " + str2[i]);
		}
		
		System.out.println();
		System.out.println("str2출력 2");
		
		for (String color : str2) {
			System.out.print(color + "\t");
		}
	}

}

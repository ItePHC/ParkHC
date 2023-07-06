package day0623;

public class ArrString_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 배열선언 문자열 선언 후 초기 값
		String[] str = new String[4];
		
		//초기화
		str[0] = "a";
		str[1] = "b";
		str[2] = "c";
		str[3] = "d";
		
		//출력
		
		System.out.println("for문 출력");
		
		for(int i = 0; i < str.length; i++) {
			System.out.println((i + 1) + " : " + str[i]);
		}
		
		System.out.println("for~each문 출력");
		for (String name : str) {
			System.out.println(name);

		}
		
		
	}

}

package day0703;

import java.util.StringTokenizer;

public class StringToken_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 문자열을 특정문자로 분리하는 방법들
		
		String str = "red, magenta, gray, pink, yellow";
		
		System.out.println("String 객체의 split을 이용한 분리");
		String [] arrColors = str.split(", ");						//구분기호, arrColors로 분리한 객체를 담는다
		System.out.println("총 " + arrColors.length + "개");
		
		for(int i = 0; i < arrColors.length; i++) {
			System.out.println(i + " : " + arrColors[i]);
			
		}
		
		System.out.println("StringTokenizer객체를 이용한 분리");
		StringTokenizer st = new StringTokenizer(str, ", ");
		System.out.println("총 토큰 수 : " + st.countTokens());
		
		while(st.hasMoreTokens()) {									//hasMore형이면 boolean형, 다음 토큰이 있으면 true 없으면 false
			System.out.println(st.nextToken());
		}
	}

}

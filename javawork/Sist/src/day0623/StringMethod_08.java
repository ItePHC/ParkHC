package day0623;

public class StringMethod_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String str1 = "Have a Nice Day";
		String str2 = "          Happy Day            ";
		
		System.out.println("str2의 길이 : " + str2.length());
		System.out.println("str2의 앞 뒤 공백 제거 후 길이 : " + str2.trim().length());
		//trim() : 앞 뒤 공백 제거
		System.out.println("*" + str2 + "*");
		System.out.println("*" + str2.trim() +"*");
		
		//indexof
		System.out.println("str1에서 H의 인덱스 : " + str1.indexOf('H'));
		System.out.println("str1에서 D의 인덱스 : " + str1.indexOf('D'));
		
		System.out.println("str1에서 NICE추출 : " + str1.substring(7, 11));
		
		//replace
		System.out.println("문자열 일부를 변경 : ");
		System.out.println(str1.replace("a", "*"));
		System.out.println(str1.replace("Nice", "Good"));
		
		//숫자를 문자로
		String b1 = 12.5+"";
		System.out.println(b1);
		
		String b2 = 100 + "";
		System.out.println(b2);
		
		String b3 = String.valueOf(b1);
		String b4 = String.valueOf(b2);
		
		System.out.println(b3);
		System.out.println(b4);
		
		//문자열 분리하는 매서드 split
		String str3 = "red, blue, green, white";
		System.out.println(str3);
		
		System.out.println(",로 분리하여 출력하기");
		
		String[] arr = str3.split(", ");
		System.out.println("분리된 색상 갯수 : " + arr.length);
	
		//출력 
		for(String color:arr)
		System.out.println(color);   
		
	}
	
	

}

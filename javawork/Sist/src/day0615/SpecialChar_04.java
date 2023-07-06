package day0615;

public class SpecialChar_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//문자열 내에서 특별한 의미로 해석되는 문자를 이스케이프 시퀀스(Escape Sequence)
		//이스케이프 시퀀스(Escape Sequence)는 모두 \로 시작함
		/*
		 *\t : 다음 탭 위치로 이동(Tab 1회 추가)
		 *\n : 다음줄로 이동(Println 1회 추가)
		 *\" : 쌍따옴표 (" 표시)
		 *\' : 홑따옴표 (' 표시)
		 *\\; : 백슬래시 기능 (\ 표시)
		 */
		
		System.out.println("Apple\tMelon");
		System.out.println("Orange\tKiwi\tBanana");
		System.out.println("Apple\\");
		System.out.println("Apple\"");
		System.out.println("Apple\'");
		
		//"Hello"
		System.out.println("\"Hello\"");
		//C:\
		System.out.println("C:\\");
		//Q: "red",'green',"blue"
		System.out.println("\"red\",\"green\",\"blue\"");
		
		System.out.println("\"red\",\"green\",\"blue\"");		
	}

}
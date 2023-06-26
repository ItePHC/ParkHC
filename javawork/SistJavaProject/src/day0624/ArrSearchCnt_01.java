package day0624;

import java.util.Scanner;

import day0620.StringEqual_07;

public class ArrSearchCnt_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//성을 입력시 그 성씨를 가진 사람과 총 인원수를 출력하시오. 종료라고 하면 프로그램 종료
		
		
		String [] name = {"김선호", "나나", "이효리", "엄정화", "김완선", "보아", "유재석",
				"하하", "김연진", "이진"};
		int cnt = 0;
		Scanner sc = new Scanner(System.in);
		String search; //입력할 성씨
		
		
		
		
		while(true) {
			
			
			System.out.println("찾으려는 성씨를 입력해주세요, 종료를 원하시면 종료를 입력해 주세요.");
			search = sc.nextLine();
			
			if(search.equals("종료"))
				break;
			
			boolean find = false;
			
			for(int i = 0; i < name.length; i++ ) {
				if(name[i].startsWith(search)) {
					cnt++;
					find = true;
					System.out.println(i + " : " + name[i]);
				}
			
			}
			if(find)
				System.out.println(search + "씨는 총 " + cnt + "명 입니다.\n");
			if(!find)
				System.out.println(search + "씨 성을 가진 사람은 없습니다.\n");
		/*	else	//!find
				System.out.println(search + "씨 성을 가진 사람은 없습니다.\n");
		*/
			
			
		
			
			
			
			/*name = startsWith(search) {
				cnt++;
				System.out.println(search + "씨는 총 " + cnt + "명 입니다." );
			}
			}
			*/
			
		}

	}

}

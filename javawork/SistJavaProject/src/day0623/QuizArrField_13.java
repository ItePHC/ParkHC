package day0623;

import java.util.Scanner;

public class QuizArrField_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//이름을 입력해서 없으면 없다고, 있으면 몇번째에 있는지 찾기
		
		String [] stuNames = {"이성신", "이민규", "박병주", "최성현", "김영준", "강연주",
							  "최진평", "고은비", "송주영"}; 
		String name;
		boolean flag;
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("찾으시는 이름을 입력해 주세요 / 종료를 원하시면 '끝'을 입력해 주세요");
				name = sc.nextLine();
			
			if(name.equals("끝"))
						break;
			
			flag = false;
			
			for (int i = 0; i < stuNames.length; i++) {
				if(name.equals(stuNames[i])) {
					flag = true;
					System.out.println((i + 1) + "번째에서 검색");		
					
				}	
				
			}
			if(!flag)
				System.out.println(name + "은 찾을수 없습니다. 다시 입력해주세요");

		}
		
		
	}

}

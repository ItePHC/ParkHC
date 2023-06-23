package day0623;

import java.util.Scanner;

public class ArrayIntField_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 숫자를 입력해서 그 숫자가 있는지 찾기
		// 있으면 없다고, 있으면 그 숫자가 몇번째에 있는지 찾기
		// 0을 입력시 종료(while(true))
		
		Scanner sc = new Scanner(System.in);
		
		int [] data = {5, 10, 15, 30, 40, 78, 60, 50, 99, 102};
		int num; //입력할 수
		boolean flag;
		
		
		while(true) {
			System.out.println("검색할 숫자를 입력해 주세요");
			num = sc.nextInt();
			
			if (num == 0) {
				System.out.println("검색을 종료합니다.");
				break;
			}
			
			//있다 없다에 대한 초기 값
			flag = false; //찾으면 true로 변경
			
			// 값 찾기 
			for (int i = 0; i < data.length; i++) {
				if (num == data[i]) {
					flag = true;
					System.out.println((i + 1) + "번째에서 검색");
				}
				
				
			}
			if(!flag) // !=flag == (flag == false) ==> false / (flag) ==> true
				System.out.println(num + "는 데이터에 없습니다");	
		}
		
		
	}

}

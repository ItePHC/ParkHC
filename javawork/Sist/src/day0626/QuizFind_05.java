package day0626;

import java.util.Iterator;
import java.util.Scanner;

public class QuizFind_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 숫자를 입력 받아서 배열의 몇번째에 있는지 출력하고 없을경우 없습니다 라고 출력할 것
		// (0이면 종료)
		// 입력값 : 123
		//		123은 2번째에 있습니다
		//입력값 : 100
		//		100은 없습니다
		//입력값 : 0
		// 		종료합니다(프로그램 종료)
		
		int input;
		int [] arrNums = {5, 123, 7, 60, 9, 30, 22, 71, 1, 3, 6, 8, -2};
		Scanner sc = new Scanner(System.in);
		
		while(true) {
		System.out.println("숫자를 입력해 주세요, 0을 입력하면 프로그램이 종료됩니다.");
		input = sc.nextInt();
		boolean inputnum = false;
		
		if(input == 0) {
			System.out.println("프로그램을 종료합니다.");
			System.out.println();		
			break;
		}
		
		for(int i = 0; i < arrNums.length; i++) {
			if(input == arrNums[i]) {
				inputnum = true;
				System.out.println(input + "은 " + (i + 1) + "번째에 있습니다");
				System.out.println();		
				}
			}
		if(!inputnum/* = (==false)*/) {
			System.out.println(input + "은 없습니다");
			System.out.println();
			}

		}
		
	}

}




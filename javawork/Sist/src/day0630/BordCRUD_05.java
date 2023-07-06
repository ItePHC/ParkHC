package day0630;
//CRUD중요   ***복습필요
import java.util.Scanner;

interface Board {
	public void process();
}

class Insert implements Board {

	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 추가합니다");
	}
	
}

class Select implements Board {
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 조회합니다");
	}
}

class Update implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 수정합니다");
	}	
}

class Delete implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 삭제합니다");
	}
}

public class BordCRUD_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
				
		Board board = null;		
		
		int n; // 입력할 숫자
	
		exit : while(true) {
			System.out.println("1. 추가\t2. 조회\t3. 수정\t4. 삭제\t9. 종료");
			System.out.println("===============================================");
			n = sc.nextInt();
			
			switch (n) {
			case 1:
				board = new Insert();
				break;
			case 2 :
				board = new Select();
				break;
			case 3 :
				board = new Update();
				break;
			case 4 :
				board = new Select();
				break;
			case 9 :
				System.out.println("종료합니다");
				break exit;
			//	System.exit(0);								//강제종료하는 방법
			default :
				System.out.println("잘못입력했습니다");
				break;
			}
			if(n<=4)
				board.process();
			
		}
	}

}

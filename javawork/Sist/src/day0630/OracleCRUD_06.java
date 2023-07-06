package day0630;

import java.util.Scanner;

abstract class Command {
	abstract public void write();
	
}

class Insert_2 extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 추가합니다");
	}
	
}

class List extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 조회합니다");
	}
	
}

class Modify extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 수정합니다");
	}
	
}

class Delete_2 extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 삭제합니다");
	}
	
}

public class OracleCRUD_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int n;
		
		Board board = null;		
		
		exit : while(true) {
			System.out.println("1. 추가\t2. 조회\t3. 수정\t4. 삭제\t9. 종료");
			System.out.println("===============================================");
			n = sc.nextInt();
			
			switch (n) {
			case 1:
				board = new Select();
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

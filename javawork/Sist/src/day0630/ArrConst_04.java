package day0630;
/*
성현이가 게임을 합니다
순영이가 게임을 합니다
선범이가 게임을 합니다
================
선범이가 게임을 종료합니다
순영이가 게임을 종료합니다
성현이가 게임을 종료합니다
*/
	abstract class Game {
	abstract void play();
	abstract void stop();
}

class SungHyun extends Game {

	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 합니다");
	}

	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 종료합니다");
	}
	
}

class SoonYeong extends Game {

	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("순영이가 게임을 합니다");
	}
	
	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.out.println("순영이가 게임을 종료합니다");
	}
}

class sunBum extends Game{

	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 합니다");
	}

	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 종료합니다");
	}
	
}


public class ArrConst_04 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	//배열선언
		Game[] game = new Game[3];
		
	//각각의 sub로 생성
		game[0] = new SungHyun();
		game[1] = new SoonYeong();
		game[2] = new sunBum();
		
	//for문(증가)
		for(int i = 0; i < game.length; i++) {
			game[i].play();
		}
		System.out.println("=========================");
		
	//for(감소)
		for(int i = game.length - 1; i >= 0; i--) {
			game[i].stop();
		}
	}

}

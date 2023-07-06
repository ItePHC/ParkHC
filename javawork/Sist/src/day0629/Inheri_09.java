package day0629;

class work {
	public void process() {
		System.out.println("작업중");
	}
}
////////////////////////////////////////////////////
class Food extends work {
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***음식을 합니다***");
	}
}
////////////////////////////////////////////////////
class clean extends work {
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***청소를 합니다***");
	}
}
////////////////////////////////////////////////////
class Study extends work {

	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***공부를 합니다***");
	}
}
////////////////////////////////////////////////////
public class Inheri_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 일반적인 생성...메서드 호출
		Food food = new Food();
		clean clean = new clean();
		Study study = new Study();
		
		food.process();
		clean.process();
		study.process();
		
		// 다형성...하나의 변수로 호출시 누가 생성되었느냐에 따라 그 기능이 달라짐
		System.out.println("다형성 출력중");
		
		work work = null;
		
		work = new Food();
		work.process();
		
		work = new clean();
		work.process();
		
		work = new Study();
		work.process();
		
	}

}

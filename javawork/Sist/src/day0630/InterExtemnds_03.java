package day0630;

interface InterAA {
	
	public void eat();
	public void go();
}

interface InterBB extends InterAA {
	
	public void ride();
}


class InterImpl2 implements InterBB{		//클래스에서 한번에 구현하나 인터페이스에서 구현하고 클래스에서 구현하나 같다

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println("저녁을 먹어요");
	}

	@Override
	public void go() {
		// TODO Auto-generated method stub
		System.out.println("집에 가요");
	}

	@Override
	public void ride() {
		// TODO Auto-generated method stub
		System.out.println("자전거 타고 놀아요");
	}
	
}

public class InterExtemnds_03 {
	
	//3개 모두 호출
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InterImpl2 impl2 = new InterImpl2();
		impl2.eat();
		impl2.go();
		impl2.ride();
		
	//다형성 호출
		InterBB bb = new InterImpl2();
		bb.eat();
		bb.go();
		bb.ride();
		
		
	}

}

package day0630;

//다중상속문
interface InterA {
	
	public void draw();
	public void write();
}

interface InterB {		//같은 interface라 extends로도 상속가능
	
	public void play();
	
	
}

//2개의 interface를 implements를 통해 구현
class Impl implements InterA, InterB {
	
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("축구를 합니다");	
	}
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("그림을 그립니다");
	}
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("일기를 씁니다");
	}
}


public class InterImpl_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//생성
		Impl i1 = new Impl();
		i1.draw();
		i1.write();
		i1.play();
		
		System.out.println();
		
		//다형성
		InterA inA = new Impl();
		inA.draw();
		inA.write();
		
		InterB inB = new Impl();
		inB.play();
		
		
	}

}

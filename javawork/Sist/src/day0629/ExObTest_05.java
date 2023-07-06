package day0629;

class Point {
	int x;
	int y;
	
	//디폴트 생성자
	public Point() {
		System.out.println("super_디폴트 생성자");
	}
	
	//명시적 생성자
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("인자있는 생성자");
	}
//메서드
	public void write() {
		System.out.println("x좌표 : " + x + ", y 좌표 : " + y);
	}
}	


	
//////////////////////////////////////////////////////////////////
class SubPoint extends Point {
	String msg;
	
	public SubPoint(int x, int y, String msg) {
		super(x, y);
		this.msg = msg;
	}
	
	public SubPoint() {
		super();		//생략되었음
		System.out.println("sub_디폴트 생성자");
	}
	
	//오버라이딩
	@Override
	public void write() {
		super.write();
		System.out.println("메세지 : " + msg);
	}
	
}

//////////////////////////////////////////////////////////////////
public class ExObTest_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubPoint sp1 = new SubPoint(4, 8, "ㄱㄱ");
		sp1.write();
	}

}

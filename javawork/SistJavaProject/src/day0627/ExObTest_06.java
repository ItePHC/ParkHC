package day0627;

class ObTestA{
	
	private int xx;						//private가 있으면 set,get 메서드가 있어야함
	private static int y;				//static메서드는 static 변수밖에 못 만듬
	
	//x
	public void setx(int xx) {						//set 메서드는 무조건 void
		this.xx = xx;
		// x = xx;	//이름이 틀릴땐 this 생략 가능
	}
	//x
	public void getX() {							//get 메서드는 int, string, void로 선언 가능
		System.out.println("x= " + this.xx);			// int, string으로 선언시 return 필요
	}
	
	public static void sety(int yy) {
		// this.y = yy; 래퍼런스변수는 this를 가지고있지 않다\
		// 일반변수 호출 못함... static변수만 호출가능
		ObTestA.y = yy;
		// = y = yy;	
	}
	
	public static void gety() {
		System.out.println("y = " + ObTestA.y);
	}
	
}

////////////////////////////////////////////////////////////
public class ExObTest_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

/*				
		//x는 생성... private 붙이는 순간 에러발생... 메서드로 접근해야함
		ObTestA oa1 = new ObTestA();
		System.out.println(oa1.x);
		//y는 클래스명으로 호출
		System.out.println(ObTestA.y);
*/
		//private 변수이므로 메서드를 만들어서 호출가능... 변수에 직접 접근안됨
		ObTestA oa1 = new ObTestA();
		oa1.setx(20);
		oa1.getX();
		
		
		ObTestA oa2 = new ObTestA();
		oa2.setx(50);
		oa2.getX();
		
		// ObTestA.y = 200; privat이므로 멤버 y 에 직접 접근불가
		// y호출... 클래스명으로 호출
		
		ObTestA.sety(100);
		ObTestA.gety();
		
	}

}

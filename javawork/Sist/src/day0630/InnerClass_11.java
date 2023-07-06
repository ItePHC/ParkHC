package day0630;
//내부클래스 : 특정 클래스 내에 또 다른 클래스가 정의됨
// 하나의 멤버(메서드)처럼 사용가능(외부의 모든 멤버들을 자신의 멤버처럼 사용가능)
// 상속이 하나인 단점을 어느정도 보완해줌

class OuterObj {
	
	class InnerObj {
		
		public void write() {
			System.out.println("내부클래스의 메서드");
		}
		
	}
	public void showMSG() {
		System.out.println("외부클래스의 메서드");
		System.out.println("외부에서 내부클래서 메서드 호출");
	
		InnerObj inObj = new InnerObj();
		inObj.write();
	}
	
}

public class InnerClass_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		OuterObj outObj = new OuterObj();
		outObj.showMSG();
		System.out.println("----------------------------------");
		
		//내부클래스의 메서드 선언, 외부메서드를 통해서만 가능
		// 1번방법
		// OuterObj.InnerObj obj = new OuterObj().new InnerObj();
		// obj.write();
		///////////////////////////////////////////////////////////
		// 2번방법
		OuterObj.InnerObj obj = outObj.new InnerObj();
		obj.write();
	}

}

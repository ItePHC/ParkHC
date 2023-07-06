package day0628;


class Test2 {						// reference : 주소값 / int에서 다른 고정값을 지정하기 위해 this사용
	int n =0;						// instance : 같은 메모리(주소값)를 공유하나 다른 고정값을 사용하므로 값 증가X;
	static int cnt=0;				// static : 같은 메모리를 공유하고 같은 고정값을 사용하므로 사용할떄마다 값 증가;
	
	public Test2() {
		System.out.println("생성자 호출");
		n++;
		cnt++;
	
	}
	
	public void write() {
		System.out.println("cnt = " + cnt + "\tn = " + n);
	}
	
}

///////////////////////////////////
public class VarTest_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Test2 t1 = new Test2();
		t1.write();
		
		Test2 t2 = new Test2();
		t2.write();
		
		Test2 t3 = new Test2();
		t3.write();
		
	}

}

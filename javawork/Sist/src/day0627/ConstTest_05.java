package day0627;

class ConstA {
	
	int num = 0;
	
	//디폴트생성자... 명시적인 생성자를 만들면 디폴트 생성자는 자동생성되지 않는다
	//필요하면 만들어준다.
	
	public ConstA() {
		num = 10;
		System.out.println("디폴트생성자");
	}
	
	//명시적 생성자(인자있는생성자)
	public ConstA(int num) {						//생성할때 인자값을 넘김
		// TODO Auto-generated constructor stub
		this.num = num;								//같은 이름일땐 this를 붙여줘야 한다.(*int일 경우에만 this를 붙일수 있음)
		System.out.println("생성자 호출");				// ex) this.num = num;
	}
	
	//매서드
	public int getNumber() { // int값을 반드시 return해줘야함, void형이면 return 필요X
	
		num=50;
		
		return num;
	}
}

//////////////////////////////////////////////
public class ConstTest_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//명시적생성자(인자값으로 num을 보낸 생성자)
		ConstA ca1 = new ConstA(30);		//생성과 동시에 인자값 부여
		System.out.println(ca1.num);
		
		//디폴드 생성자
		ConstA ca2 = new ConstA();
		System.out.println(ca2.num);
		
		//매서드 호출
		ConstA ca3 = new ConstA();
		//ca3.num = 10000;
		System.out.println(ca3.getNumber());
		
		
		
		
	}

}

package day0629;

public class Manager_04 extends Employee_04 {

	String buseo;
	public Manager_04(String name, int sal, String b) {
		super(name, sal);	//부모생성자 호출
		buseo = b;			//초기화(= 자식생성자 추가)
		
	}
	
	//하위클래스에서 부모클래스의 메서드를 수정해서 사용하는 것 : 오버라이딩
	//1. 상속이 전제 2. 메서드이름 동일 3. 리턴타입도 동일
	@Override										//부모메서드를 Override함		(override : 하위클래스에서 부모클래스의 부족한부분을 완성하는 것)
	public String getEmp() {
		// TODO Auto-generated method stub
		return super.getEmp() + ", " + buseo;		//부족한 부분 완성	(", " + buseo)
	}
	
	
}

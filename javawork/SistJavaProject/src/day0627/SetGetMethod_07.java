package day0627;


class Student {
	
	private String name; // null
	private int age;	//0
	
	//setter_method
	//인스턴스 변수에 저장된 데이터를 수정하는 목적(set 변수명)
	//저장 수정용도 이므로 리턴값(결과값)이 없다 (void지정필수)
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	//getter_method
	//인스턴스 변수에 저장된 데이터를 조회(=출력)할 목적으로 사용(get 변수명)
	//데이터를 얻는 목적이므로 호출데이터를 넘겨 줄 필요가 없으므로 인자값(=파라메타값)이 없다.
	//실행결과를 돌려주므로 "return결과값" 으로 지정
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
}
//////////////////////////////////////////////
public class SetGetMethod_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//1.객체생성
		Student stu1 = new Student();	//참조변수 stu1을 통해
		
		//2. 참조변수명으로 set 매서드 호출
		stu1.setName("박희찬");
		stu1.setAge(24);
		
		String name = stu1.getName();
		int age = stu1.getAge();
		
		System.out.println(stu1.getName() + "은 " + stu1.getAge() + "살 입니다");
		
		
		//2번째 생성 및 출력
		Student stu2 = new Student();
		
		stu2.setName("김이박");
		stu2.setAge(12);
			
		System.out.println(stu2.getName() + "은 " + stu2.getAge() + "살 입니다");
	}

}

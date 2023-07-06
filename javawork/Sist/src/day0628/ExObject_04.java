package day0628;

class MyInfo {
	
	private String name;
	private int age;
	private String hp;
	public static final String ADDR = "Seoul";		//public은 공용(static으로 보내도 연결함으로서 static생략하고 출력 가능)
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}

	// 3개의 멤버를 한번에 변경할 메서드
	public void setData(String name, int age, String hp) {
		this.name = name;
		this.age = age;
		this.hp = hp;
	}
	
	// 3개의 멤버를 한번에 출력
	public void getData() {
		System.out.println("이름 : " + name);
		System.out.println("나이  : " + age);
		System.out.println("핸드폰 번호 : " + hp);
	}
	
	
}


////////////////////////////////////////////////
public class ExObject_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyInfo in1 = new MyInfo();
		//setter
		in1.setName("박희찬");
		in1.setAge(22);
		in1.setHp("010-1111-2222");
		
		//getter
		String name = in1.getName();
		int age = in1.getAge();
		String hp = in1.getHp();
		
		//출력
		System.out.println("사는 지역 : " + MyInfo.ADDR);
		System.out.println("이름 : " + name + ", 나이 : " + age + ", 핸드폰 : " + hp);
		System.out.println("======================================================");
		
		// 생성 2
		MyInfo in2 = new MyInfo();
		
		//set get data
		in2.setData("김이박", 23, "010-1234-5678");
		in2.getData();
	
	}

	
}

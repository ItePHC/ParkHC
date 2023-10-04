package spring.di.ex2;

public class Person {
	String schoolName;
	Myinfo info;
	
	public Person(Myinfo info) {
		/* super(); 생략됨 */
		super();
		this.info = info;
	}

	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	public void writeData() {
		System.out.println("학생 정보 출력");
		System.out.println("학교명 : " + schoolName);
		System.out.println("학생명 : " + info.name);
		System.out.println("나이 : " + info.age);
		System.out.println("주소 : " + info.addr);
	}
}

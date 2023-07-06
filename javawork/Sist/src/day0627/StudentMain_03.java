package day0627;

public class StudentMain_03 {
	
	public static void main(String[] args) {
		
		Student_03 stu1 = new Student_03();
		Student_03 stu2 = new Student_03();
		Student_03 stu3 = new Student_03();
		
		stu1.name = "최성현";
		stu1.age = 25;
		
		stu2.name = "박영주";
		stu2.age = 22;
		
		Student_03.schoolName = "쌍용고등학교";
		System.out.println("***클래스 멤버값 출력***");
		System.out.println("학교명 : "+ Student_03.schoolName);
		
		System.out.println("학생1 정보");
		System.out.println("이름 : " + stu1.name + ", 나이 : " + stu1.age);
		System.out.println();
		System.out.println("학생2 정보");
		System.out.println("이름 : " + stu2.name + ", 나이 : " + stu2.age);
	}
	
}

package day0628;

class Student {
	
	private String sname;
	private String hp;
	private int grade;
	
	//명시적 생성자
	public Student(String name, String hp, int grade) {
		this.sname = name;
		this.hp = hp;
		this.grade = grade;
	}
	
	//멤버값 출력데이터
	public void getData() {
		System.out.println("이름 : " + sname);
		System.out.println("연락처 : " + hp);
		System.out.println("학년 : " + grade);
	}
}

////////////////////////
public class ArrObject_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		Student [] stu = new Student[3];
		
		stu[0] = new Student("박희찬", "010-1234-5678", 1);
		stu[1] = new Student("김이", "010-1111-2222", 2);
		stu[2] = new Student("정찬", "010-3333-4444", 1);
		*/
		
		//생성하면서 바로 초기화
		Student[] stu = {
				new Student("박희찬", "010-1234-5678", 1),
				new Student("김이", "010-1111-2222", 2),	
				new Student("정찬", "010-3333-4444", 4)
		};
		//출력 #1
		for(int i = 0; i < stu.length; i++) {
			Student s = stu[i];
			s.getData();
			// stu[i].getData();
			System.out.println();
			System.out.println("=====================");
			
		//출력 #2  
		for(Student s1 : stu ) {
			s1.getData();
			System.out.println("===================");
			}
		}
		
	}

}

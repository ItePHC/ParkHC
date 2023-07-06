package day0627;

public class InfoMain_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Info_08 in1 = new Info_08("박희찬", 24, "경기도 군포시");
		
		//getMethod 변수지정
		String name = in1.getstuName();
		int age = in1.getage();
		String addr = in1.getaddr();
		
		System.out.println("이름은 " + name + "(이)고 나이는 " + age + "세이며 주소는 " + addr + "입니다");
		
		Info_08 in2 = new Info_08("김이", 8, "주소");
		System.out.println("이름은 " + in2.getstuName() + "(이)고 나이는 " + in2.getage() + "세이며 주소는 " + in2.getaddr() + "입니다");
		
		//디폴트 생성자로 생성
		Info_08 in3 = new Info_08();
		System.out.println("이름 : " + in3.getstuName() + "\n나이 : " + in3.getage() + "\n주소 : " + in3.getaddr());
 
		
		
		
	}

}

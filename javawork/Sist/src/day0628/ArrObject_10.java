package day0628;

class MyPersonInfo {
	private String name;
	private String blood;
	private String age;
	
	public MyPersonInfo(String name, String blood, String age) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.blood = blood;	
		this.age = age;
	}
	
	//제목
	public static void title() {
		System.out.println("이름\t혈액형\t나이");
		System.out.println("===============================");
	}
	
	//출력문
	public void getInfo() {
		System.out.println(name + "\t" + blood + "형\t" + age + "세");
	}
	
	
}

/////////////////////////////////
public class ArrObject_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		// 방법1
		MyPersonInfo [] my = {
		new MyPersonInfo("김인", "O", "22"),
		new MyPersonInfo("정인", "A", "24"),
		new MyPersonInfo("김정", "B", "28")
		};
		
		System.out.println("총 " + my.length + "명의 정보 출력");
		MyPersonInfo.title();
		
		for(MyPersonInfo info : my)
			info.getInfo();
		*/
		
		System.out.println("-------------------------------------");
		
		/*
		//방법 2
		System.out.println("총 " + my.length + "명의 정보 출력");

		MyPersonInfo [] my = {
		new MyPersonInfo("김인", "O", "22"),
		new MyPersonInfo("정인", "A", "24"),
		new MyPersonInfo("김정", "B", "28")
		};  
		
		System.out.println("총 " + my.length + "명의 정보 출력"); 
		MyPersonInfo.title();
		
		for(int i = 0; i < my.length; i++) {
			my[i].getInfo();
		}
		*/
		
		System.out.println("-------------------------------------");
		
		/*
		
		//방법 3
		MyPersonInfo.title();
		MyPersonInfo i1 = new MyPersonInfo("김인", "O", "22");
		MyPersonInfo i2 = new MyPersonInfo("정인", "A", "24");
		MyPersonInfo i3 = new MyPersonInfo("김정", "B", "28");
		
		System.out.println("총 " + my.length + "명의 정보 출력"); 
		MyPersonInfo.title();
		
		i1.getInfo();
		i2.getInfo();
		i3.getInfo();
		*/
		
		
	}

}

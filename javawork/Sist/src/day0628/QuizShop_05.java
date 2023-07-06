package day0628;

class MyShop {
	private String sangName;
	private String inputday;
	private String outputday;
	
	// 3개의 데이터를 한번에 수정할 수 있는 메서드
	public void setData(String Name, String input, String output) {
		sangName = Name;
		inputday = input;
		outputday = output;
	}
	
	// 3개의 데이터를 한번에 출력할 수 있는 메서드
	public void getData() {
		System.out.println("상품명 : " + sangName);
		System.out.println("입고일 : " + inputday);
		System.out.println("출고일 : " + outputday);
	}
	
	
	public String getData_2(){			//void가 없으면 return string;을 해줘야 한다
	
	
	String s = "상품명 : " + sangName + "\n입고일 : " + inputday + "\n출고일 : " + outputday;
	
	return s;							//void가 없으면 return string;을 해줘야 한다
	}
	
	 
	 
}

/*
	[상품입고]
상품명 : 키보드
입고일 : 2023-06-01
출고일 : 2023-06-20
*/


public class QuizShop_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyShop in1 = new MyShop();
		
		in1.setData("키보드", "2023-06-01", "2023-06-20");
		in1.getData();	
		System.out.println();
		
		
		MyShop in2 = new MyShop();
		in2.setData("마우스", "2023-06-15", "2023-06-20");
		in2.getData();
		System.out.println();
		
		
		/*
		// void를 제외한 getdata문으로 만들때 출력방법
		System.out.println(in3.getData_2());
		*/
	}

}

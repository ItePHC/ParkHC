package day0628;

class Apple{
	
	private String writer;
	private String subject;
	private static String msg = "Happy Day!!";
	
	//각각의 setter,getter
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public static String getMsg() {
		return msg;
	}
	public static void setMsg(String msg) {
		Apple.msg = msg;
	}
		
}


public class ExObject_08 {
	
	
	//연결
	public static void writeApple(Apple ap1) {
		System.out.println("Apple클래스 출력***");
		
		System.out.println("작성자 : " + ap1.getWriter());
		System.out.println("제목 : " + ap1.getSubject());
	}
	
	//생성
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("Apple클래스의 메세지 출력");
		System.out.println(Apple.getMsg());
		
		Apple a1 = new Apple();
		a1.setWriter("김이");
		a1.setSubject("가나다라");
		
		Apple a2 = new Apple();
		a2.setWriter("이박");
		a2.setSubject("마바사아");
		
		//writeApple 호출
		writeApple(a1);
		writeApple(a2);
		
		
	}

}

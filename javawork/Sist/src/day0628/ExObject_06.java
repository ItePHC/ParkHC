package day0628;

class Member {
	
	private String stuName; //학생명
	private String gender; 	//성별
	private String addr;	//주소
	
	static String sistclass; //반
	static int cnt=0;		 
	
	//수정용 메서드
	public void setMembers(String name, String gd, String addr) {
		this.stuName = name;
		gender = gd;
		this.addr = addr;
	}
	
	
	
	//출력용 메서드
	public void getMembers() {
		cnt++;
		System.out.println("***학생" + cnt + " 정보 ***");
		//System.out.println("학생명 : " + this.stuName);
		System.out.println("학생명 : " + stuName);
		System.out.println("소속학급 : " + Member.sistclass);
		//System.out.println("성별 : " + this.gender);
		System.out.println("성별 : " + gender);
		//System.out.println("주소 : " + this.addr);
		System.out.println("주소 : " + addr);
	}
	
	
}


public class ExObject_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Member m1 = new Member();
		Member.sistclass = "쌍용 자바 7반";
		
		m1.setMembers("박희찬", "남자", "서울");
		m1.getMembers();
		System.out.println("========================");
		
		Member m2 = new Member();
		m2.setMembers("김", "여자", "경기");
		m2.getMembers();
		System.out.println("========================");
		
	}

}

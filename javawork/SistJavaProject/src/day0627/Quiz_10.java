package day0627;

public class Quiz_10 {

	//멤버변수선언
	private String name; //상품명
	int su; //수량
	int dan; //단가
	static String SHOPNAME = "롯데 마트"; //상점
	
	
	
	public void setName(String name) {
		this.name=name;
	}
	public void setSu(int su) {
		this.su=su;
	}
	public void setDan(int dan) {
		this.dan=dan;
	}
	
	/*
	//명시적 생성자
	public Quiz_10(String name, int su, int dan) {
		this.name=name;
		this.su=su;
		this.dan=dan;
	}
	*/
	
	
	public String getname() {
		return name;
	}
	
	public int getsu() {
		return su;
	}
	
	public int getdan() {
		return dan;
	}
	
	//디폴트생성자
	public Quiz_10() {
	}
}

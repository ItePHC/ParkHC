package day0628;

class Score {
	
	private String stuName;
	private int java;
	private int oracle;
	private int html;
	
	static final String TITLE = "중간고사 시험결과";
	
	//자동 setter, getter
	
	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}
	
	
	//합계메서드
	public int getTot() {
		int sum = java+ oracle + html;
		return sum;
	}
	
	//평균메서드
	public double getAvg() {
		double avg = getTot() / 3.0;
		return avg;
	}
	
}
/*
	중간고사 시험결과
	학생명 : 김지윤
	자바점수 : 99
	오라클점수 : 88
	HTML점수 : 56
	====================
	학생명 : 이현
	자바점수 : 78
	오라클점수 : 90
	HTML점수 : 66
	

*/
public class ExObject_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Score s1 = new Score();
		s1.setStuName("김지윤");
		s1.setJava(99);
		s1.setOracle(88);
		s1.setHtml(56);
		
		String name = s1.getStuName();
		int java = s1.getJava();
		int oracle = s1.getOracle();
		int html = s1.getHtml();
		int tot = s1.getTot();
		double avg = s1.getAvg();
		
		System.out.println("***" + Score.TITLE + "***");
		System.out.println("학생명 : " + name);
		System.out.println("자바점수 : " + java);
		System.out.println("오라클 점수 : " + oracle);
		System.out.println("HTML점수 : " + html);
		System.out.println("합계 : " + tot);
		System.out.println("평균 : " + avg);
		System.out.println("======================");
		
		
		Score s2 = new Score();
		s2.setStuName("이현");
		s2.setJava(78);
		s2.setOracle(90);
		s2.setHtml(66);
		
		
		System.out.println("***" + Score.TITLE + "***");
		System.out.println("학생명 : " + s2.getStuName());
		System.out.println("자바점수 : " + s2.getJava());
		System.out.println("오라클 점수 : " + s2.getOracle());
		System.out.println("HTML점수 : " + s2.getHtml());
		System.out.println("합계 : " + s2.getTot());
		System.out.println("평균 : " + s2.getAvg());
		System.out.println("======================");
		
		
		
		
	}

}

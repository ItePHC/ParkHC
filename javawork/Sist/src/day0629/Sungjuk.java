package day0629;
/*
	학생명 Java Oracle 총점 평균 평가
*/
public class Sungjuk {
	private static String schoolName;
	private String name;
	private int Java, Oracle;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJava() {
		return Java;
	}
	public void setJava(int java) {
		Java = java;
	}
	public int getOracle() {
		return Oracle;
	}
	public void setOracle(int oracle) {
		Oracle = oracle;
	}
	
	
	public int getTot() {
		return Java + Oracle;
	}
	
	public double getAvg() {
		return getTot() / 2.0;
	}
	public static String getSchoolName() {
		return schoolName;
	}
	public static void setSchoolName(String schoolName) {
		Sungjuk.schoolName = schoolName;
	}
	
	public String getPyungga() {
		if(getAvg() >60) {
			return "합격입니다";
		}
		else {
			return "불합격입니다";
		}
		
	}
	
}

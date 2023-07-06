package day0629;

import java.util.Scanner;

public class SungjukMain {

	public static void getSungjuk(Sungjuk s) {		//Sungjuk테이블에서 가져옴
		System.out.println(s.getName() + "\t" + s.getJava() + "\t" + s.getOracle() + "\t" + s.getTot() + "\t" + s.getAvg() + "\t" + s.getPyungga());
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	Scanner sc = new Scanner(System.in);
	int inwon;
	Sungjuk [] sj;
	String schoolName;
	
	System.out.println("입력할 인원수"); //배열 할당
	inwon = Integer.parseInt(sc.nextLine());	//형변환 하는 이유??
	
	System.out.println("학교 명?");
	schoolName = sc.nextLine();
	
	Sungjuk.setSchoolName(schoolName);
	
	//인원수만큼 배열 할당
	sj = new Sungjuk[inwon];
	
	//인원수 입력
	for(int i = 0; i < inwon; i++) {
		System.out.println(i+1 + "번 학생 이름?");
		String name = sc.nextLine();
		
		System.out.println("자바와 오라클 점수 입력");
		int Java = Integer.parseInt(sc.nextLine());
		int Oracle = Integer.parseInt(sc.nextLine());
		
		//i번째 학생성적 생성
		sj[i] = new Sungjuk();
		
		//set
		sj[i].setName(name);
		sj[i].setJava(Java);
		sj[i].setOracle(Oracle);
		
		
		
		}
		
		//결과출력
		System.out.println("*****결과출력*****");
		System.out.println("학교명 : " + Sungjuk.getSchoolName());
		System.out.println("학생명\t자바점수\t오라클점수\t총점\t평균\t합격여부");
		System.out.println("===============================");
		
		for(Sungjuk s1 : sj)
			getSungjuk(s1);
		
	}

}

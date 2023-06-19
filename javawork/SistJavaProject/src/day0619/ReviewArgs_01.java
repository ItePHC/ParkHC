package day0619;

public class ReviewArgs_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//매개변수로 실행시 이름, 국영수 3과목을 넘겨서 이름, 과목점수, 총점, 평균까지 출력하시오
		
		//변수선언
		String name = args[0];
		int Kor = Integer.parseInt(args[1]);
		int Eng = Integer.parseInt(args[2]);
		int Math = Integer.parseInt(args[3]);
		
		int tot = Kor + Eng + Math;
		double avg = tot / 3.0 ;
		
		System.out.println("중간고사 시험점수");
		System.out.println("학생명 : " + name);
		System.out.println("국어 점수 : " + Kor);
		System.out.println("영어 점수 : " + Eng);
		System.out.println("수학 점수 : " + Math);
		System.out.println("총점 : " + tot);
		System.out.println("평균 점수 : " + avg);
		
	}

}

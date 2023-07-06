package day0620;

public class Switch_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n=10;
		
		switch (n)
		{
		case 1: 
			System.out.println("n is 1");
			break; // break가 없을경우 끝까지 실행
		case 2: 
			System.out.println("n is 2");
			break;
		case 3: 
			System.out.println("n is 3");
			break;
		case 4: 
			System.out.println("n is 4");
			break;
		default :
			System.out.println("n > 4");
		
		}
		
		String msg = "happy";
		
		switch (msg) 
		{
		case "hello" :
			System.out.println("안녕");
			break;
		case "happy" :
			System.out.println("행복하다");
			break;
		case "nice" :
			System.out.println("좋다");
			break;
		}
		int score = 77;
		char grade;
		
		switch(score/10) //10으로 나누지 않을 경우 1부터 100까지 입력해야 함
		{
		case 10 :
		case 9 :
			grade = 'A';
			break;
		case 8 :
			grade = 'B';
			break;
		case 7 :
			grade = 'C';
			break;
		case 6 :
			grade = 'D';
			break;
		default :
			grade = 'F';
			break;
		}
		
		System.out.println(score + " ==> " + grade);
		
	}
}

package day0703;
//문자를 입력받아 설정한 딜레이 이후 출력하기(1byte로 입력받아 )

import java.io.IOException;
import java.io.InputStream;

public class FileException_03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		InputStream is = System.in;									//뒤에 Stream이 붙은건(input"Stream") 영어만 표시가능(2byte가 안됨)
		
		int a = 0;
		
		System.out.println("한글자 입력");
		try {
			a = is.read();											//입력한 한글자 입력
		} catch (IOException e) {
			// TODO: handle exception
			System.out.println("오류" + e.getMessage());
		} 
		
		System.out.println("****3초뒤 출력****");
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("입력값" + (char)a);
	}

}

package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

//Score.txt를 읽고 몇개인지 구하고 총점, 평균을 구해서 출력
public class FileExcep_06 {
	
	public static void ScoreRead() {
		String fileName = "C:\\sist\\file\\Score.txt";
	
		BufferedReader br = null;							
		FileReader fr = null;
		
		int cnt = 0;										//총 갯수
		int total = 0;										//총 합계			
		double avg = 0;										//평균
		
		try {
			fr = new FileReader(fileName);
			System.out.println("파일을 정상적으로 읽음");
			
			br = new BufferedReader(fr);
			
			while(true) {
				String s = br.readLine();
				
				if(s == null)
					break;
				
				System.out.println(s);
				
				cnt++;// 읽은갯수
				total += Integer.parseInt(s); //합계
				}
				
				//평균구하기
				avg = (double)total/cnt;
				System.out.println("총 갯수 : " + cnt);
				System.out.println("총점 : " + total);
				System.out.printf("평균 : %.2f\n", avg);
				
			} catch (FileNotFoundException e) {
			e.printStackTrace();
			} catch (IOException e) {
				// TODO: handle exception
			}	
		
				finally {
				try {
					br.close();
					fr.close();
				} catch (IOException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ScoreRead();
		System.out.println("종료");
	}

}

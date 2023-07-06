package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;import java.io.IOException;
import java.util.StringTokenizer;

public class QuizTokenFile_09 {

	
	/*
	  ***과일목록***
	  상품	수량	단가		총금액
	  ----------------------------------
	  바나나	10	5000	50000원
	  
	 */
	private static void fruits() {
		String FileName = "C:\\sist\\file\\Fruit.txt";
		FileReader fr = null;
		BufferedReader br = null;
		
		
		
		try {
			fr = new FileReader(FileName);
			br = new BufferedReader(fr);
		
			//과일목록
			System.out.println("***과일목록***");
			System.out.println("상품\t수량\t단가\t총금액");
			System.out.println("----------------------------------");
			
			while(true) {
				String s = br.readLine();
				
				if(s == null)
					break;
				
				String [] data = s.split(", ");
				int su =  Integer.parseInt(data[1]);
				int dan = Integer.parseInt(data[2]);
				int tot = su * dan;
				System.out.println(data[0] + "\t" + su + "\t" + dan + "원\t" + tot + "원");
				
				/*
				//StringTokenizer를 이용한 분리
				
				StringTokenizer st = new StringTokenizer(s, ", ");
				
				// 치환
				String sang = st.nextToken();						//순서를 맞추기 위해 상품수도 치환
				int su = Integer.parseInt(st.nextToken());
				int dan = Integer.parseInt(st.nextToken());
				int tot = su * dan;
				
				//배열 개수만큼 반복출력
				System.out.println(sang + "\t" + su + "\t" + dan + "원\t" + tot+ "원");
				*/
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fruits();
	}

}

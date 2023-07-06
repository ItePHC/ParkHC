package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileException_04 {

	//반드시 생성해야 하는것이 아니면 static형으로 만들기
	public static void read() {
		String fileName = "C:\\sist\\file\\Monday.txt";	// 파일의 주소 설정
		
		BufferedReader br = null;									//파일리더를 통해 가져온 파일을 읽어주는 역할(한줄씩 읽음)
		FileReader fr = null;										//filereader : 문자단위밖에 못읽음 / 파일에서 가져오는 역할
	
		try {
			fr = new FileReader(fileName);
			
			System.out.println("파일을 열었어요!!!");
			
			br = new BufferedReader(fr);							//파일 리더를 읽기위해 버퍼 리더 안에 넣음
			
			
			while(true) {											//여러줄을 반복해서 읽어야 하므로 while문 사용
				
				String s = br.readLine();							//메모장에서 내용을 한줄씩 읽어온다 (br.readLine : 한줄씩 읽을수 있음)
				
				if(s == null)										//마지막 줄일경우 null값을 읽어서 null값일 경우 빠져나가기
				break;
				
				System.out.println(s);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			
			System.out.println("파일이 없어요" + e.getMessage());
		} catch (IOException e) {									//파일을 읽어서 출력할떄 예외가 발생하면 출력 할 메세지
			// TODO: handle exception
		}
		
		//가져다 쓴 자원을 반납하는 역할
		//위에 오류 발생여부와 상관없이 항상 실행되는 코드  
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
		
		read();
		System.out.println();
		System.out.println("메모 정상종료");
		
		
	}

}

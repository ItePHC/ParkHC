package day0704;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileWriter_05 {
	
	public static void fileWrite() {						//static이 있어야 main에서 구현가능
		FileWriter fw = null;								//fileWriter는 매서드로 인식되고 매서드는 초기값을 부여해줘야하므로 null을 부여한다
		String fileName = "C:\\sist\\file\\filetest1.txt";	
		
		try {
			fw = new FileWriter(fileName);					//파일생성(같은 이름이 있어도 새로 생성)
			
			//파일에 내용 추가
			fw.write("Have a Nice Day!!!\n"); 				//메모장 줄넘김
			fw.write(new Date().toString());
			System.out.println("***파일 저장 성공***");
			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}													
	
	public static void fileWrite2() {						
		FileWriter fw = null;								
		String fileName = "C:\\sist\\file\\filetest2.txt";	
		
		try {
			fw = new FileWriter(fileName,true);				//추가모드	 (기존에 파일이 있는경우 내용 추가)	
			
			//파일에 내용 추가
			fw.write("내이름은 홍길동\n");
			fw.write("===============\n");

			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fileWrite();
		fileWrite2();
	}

}

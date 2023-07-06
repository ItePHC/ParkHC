package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileBuffer_05 {

	public static void readfile() {
		
		String fileName = "C:\\sist\\file\\Memo_Practice.txt";
		
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader(fileName);
			br = new BufferedReader(fr);
			
			while(true) {
				String s = br.readLine();
				
				if(s == null)
					break;
				System.out.println(s);
			} 
		}
		catch (FileNotFoundException e) {
			System.out.println("파일이 없습니다" + e.getMessage());
		} 
		catch (IOException e) {							
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
	}	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		readfile();
		System.out.println("파일을 종료합니다");
	}

}

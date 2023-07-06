package day0704;

import java.util.ArrayList;
import java.util.Iterator;

public class ArrayList_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String [] flowers = {"장미", "후리지아", "다알리아", "수국"};
		
		//객체 삽입, 삭제할수 있는 컨테이너 클래스 생성
		ArrayList<String> list = new ArrayList<String>();
		
		//데이터 담기
		for(String f : flowers)
			list.add(f);
		
		System.out.println("size : " + list.size());
		
		System.out.println();
		System.out.println("출력#1_for");
		for(int i = 0; i < flowers.length; i++) {
			String s = list.get(i);
			System.out.println(s);
		}
		
		System.out.println();
		System.out.println("출력#2_for~each");
		for (String s : list) {
			System.out.println(s);
		}
			
	}

}

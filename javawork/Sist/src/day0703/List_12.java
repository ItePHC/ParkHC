package day0703;

import java.util.List;
import java.util.Vector;

//가장 많이 사용하는 인터페이스 _ List
//List인터페이스를 구현한 Vector, ArrayList
//순차적으로 데이터 들어감, 중복데이터 허용
//처음생성시 일정한 개수로 생성 그 이상의 데이터를 입력시 공간이 자동증가 
public class List_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//List<String> list = new Vector<String>();
		Vector<String> list = new Vector<String> ();				//List<String>이 아닌 Vector<String>로 작성해도 된다.
		
		
		System.out.println("초기 할당 크기 : " + list.capacity());		//capacity는 vector로 할떄만 받을수 있다
		System.out.println("초기 데이타 크기 : " + list.size());
		
		list.add("사과");
		list.add("오렌지");
		list.add("바나나");
		list.add("키위");
		list.add("포도");
		list.add("키위");
		
		System.out.println("현재 할당 크기 : " + list.capacity());
		System.out.println("데이타 크기 : " + list.size());
	
		System.out.println();
		System.out.println("출력#1");
		for(int i = 0; i < list.size(); i++) {					//length 대신 size사용
			String s = list.get(i);								//list에서는 get으로 i값을 얻는다
			System.out.println(s); 					
		}
		
		System.out.println();
		System.out.println("출력#2");
		for(String s : list)
			System.out.println(s);
		
		System.out.println();
		System.out.println("출력#3");
		
		Object [] ob = list.toArray();
		
		for(int i = 0; i < ob.length; i++)
			System.out.println(ob[i]);
		
	}

}

package day0703;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.jar.Attributes.Name;

public class Map_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 키는 중복을 허용하지 않고, 값은 중복을 허용한다
		//key와 value를 쌍으로 저장
		
		Map<String, String> map = new HashMap<String, String>();					//키와 벨류 둘다 string으로 지정
		map.put("name", "손석구");
		map.put("age", "23");
		map.put("addr", "경기도 ");
		
		//같은 키 값으로 넣으면 먼저 들어간 데이터는 없어짐
		map.put("name", "제니");
		
		System.out.println("size : " + map.size());
		
		System.out.println("키값을 정확하게 알면 value값을 얻을수 있다");
		System.out.println();
		
		System.out.println("이름 : " + map.get("name"));
		System.out.println("나이 : " + map.get("age"));
		System.out.println("주소 : " + map.get("addr"));
		
		System.out.println();
		System.out.println("키값을 먼저 한꺼번에 얻은 후 값을 얻는방법");
		
		Set<String> keySet = map.keySet();
		System.out.println("***방법1***");
		Iterator<String> keyIter =  keySet.iterator();
		while (keyIter.hasNext()) {													//Iterator는 while로 받는다
			String key = keyIter.next();
			System.out.println(key + " ==> " + map.get(key)); 							
		}
		System.out.println();
		
		System.out.println("****방법 2****");
		for(String key : keySet) {		
			System.out.println(key + " ==> " + map.get(key)); 
		}
	}

}

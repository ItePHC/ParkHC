package day0703;

import java.util.HashSet;

public class SetInt_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		HashSet<Integer> set1 = new HashSet<Integer>();
		
		set1.add(11);
		set1.add(8);
		set1.add(31);
		set1.add(62);
		set1.add(4);
		set1.add(8);
		set1.add(12);
		
		System.out.println("개수 : " + set1.size());
		
		System.out.println("출력#3 _ for");
		Object [] ob = set1.toArray();
		for(int i = 0; i < ob.length; i++) {
			System.out.print(ob[i] + "  ");
		}
		
		
		
	}

}

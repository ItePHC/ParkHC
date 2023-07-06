package day0704;

import java.util.List;
import java.util.Scanner;
import java.util.Vector;

/*
1. 상품입고	2.상품재고		9.종료
1
상품명? 바나나
수량? 10
가격? 1500
2
번호	상품명	수량	가격		총가격
1	바나나	10	1500	15000
*/
public class ShopMain_03 {

	List<Shop> list = new Vector<Shop>();
	
	
	 public void inputShop() {
		Scanner sc = new Scanner(System.in);
		String sangName;
		int su, dan;
		
		System.out.println("상품명 ? ");
		sangName = sc.nextLine();
		System.out.println("수량 ? ");
		su = sc.nextInt();
		System.out.println("가격 ? ");
		dan = sc.nextInt();
		
		Shop data = new Shop(sangName, su, dan);
		
		list.add(data);
		
		System.out.println("현재 데이터 갯수 : " + list.size());
	}
	
	 public void writeShop() {
		 System.out.println("상품재고");
		System.out.println("번호\t상품명\t수량\t가격\t총금액");
		
		for(int i = 0; i < list.size(); i++) {
			Shop s1 = list.get(i);
			
			String name = s1.getSangName();
			int stock = s1.getSu();
			int price = s1.getDan();
			int tot = stock * price;
			
			System.out.println((i+1) + "\t" + name + "\t" + stock + "\t" + price + "\t" + tot);
			
		}
	}
	 
	 
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ShopMain_03 sm = new ShopMain_03();
		
		
		Scanner sc = new Scanner(System.in);
		int n;
		
		
		while(true) {
			System.out.println("1.상품입고\t2.상품재고\t9.종료");
			n = Integer.parseInt(sc.nextLine());
			
			if(n == 1) 
				sm.inputShop();

			else if (n == 2)
				sm.writeShop();
			
			else if (n == 9) {
				System.out.println("시스템을 종료합니다");
				break;
			}
			else {
				System.out.println("잘못된 값을 입력하였습니다");
				continue;
			}
				
		}
		
		
		
	}

}

package spring.anno.last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 출력을 위한 과정(interface의 데이터 양식 유지)
@Component
public class OrderController {
	
	@Autowired
	ShopInter shopInter;
	
	int cnt = 10;
	String name = "진";
	
	public void insertOrder(String sang, int price, String color) {
		shopInter.insertSangpum(sang, price, color);
		System.out.println(name + "님이 " + cnt +"개를 주문함");
	}
	
	public void deleteOrder(String num) {
		shopInter.deleteSangpum(num);
	}
	
	public void selectOrder(String sang, int price, String color) {
		System.out.println("주문자 : " + name);
		shopInter.selectShop(sang, price, color);
		System.out.println("주문갯수 : " + cnt);
		System.out.println("색상 : " + color);
	}
}

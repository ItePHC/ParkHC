package spring.anno.last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// ����� ���� ����(interface�� ������ ��� ����)
@Component
public class OrderController {
	
	@Autowired
	ShopInter shopInter;
	
	int cnt = 10;
	String name = "��";
	
	public void insertOrder(String sang, int price, String color) {
		shopInter.insertSangpum(sang, price, color);
		System.out.println(name + "���� " + cnt +"���� �ֹ���");
	}
	
	public void deleteOrder(String num) {
		shopInter.deleteSangpum(num);
	}
	
	public void selectOrder(String sang, int price, String color) {
		System.out.println("�ֹ��� : " + name);
		shopInter.selectShop(sang, price, color);
		System.out.println("�ֹ����� : " + cnt);
		System.out.println("���� : " + color);
	}
}

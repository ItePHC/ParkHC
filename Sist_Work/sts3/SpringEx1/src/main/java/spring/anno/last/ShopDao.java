package spring.anno.last;

import org.springframework.stereotype.Component;

// ���� ����ϴ� ���?
@Component
public class ShopDao implements ShopInter {

	@Override
	public void insertSangpum(String sangpum, int price, String color) {
		// TODO Auto-generated method stub
		System.out.println(sangpum + " : " + price + " : " + color);
	}

	@Override
	public void deleteSangpum(String num) {
		// TODO Auto-generated method stub
		System.out.println(num + "�� ������");
	}

	@Override
	public void selectShop(String sangpum, int price, String color) {
		// TODO Auto-generated method stub
		System.out.println("***��ǰ����***");
		System.out.println("��ǰ�� : " + sangpum);
		System.out.println("���� : " + price);
		System.out.println("���� : " + color);
	}

}

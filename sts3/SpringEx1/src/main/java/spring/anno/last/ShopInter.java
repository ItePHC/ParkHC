package spring.anno.last;

// ������ �����ϴ� ���?
public interface ShopInter {
	public void insertSangpum(String sangpum, int price, String color);
	public void deleteSangpum(String num);
	public void selectShop(String sangpum, int price, String color);
	
}

package spring.anno.last;

// 데이터 저장하는 방식?
public interface ShopInter {
	public void insertSangpum(String sangpum, int price, String color);
	public void deleteSangpum(String num);
	public void selectShop(String sangpum, int price, String color);
	
}

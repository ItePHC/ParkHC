package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		OrderController order = (OrderController)app.getBean("orderController");
		
		order.insertOrder("요가매트", 40000, "블루");
		order.deleteOrder("3");
		order.selectOrder("아령", 36000, "블랙");
	}

}

package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		Fruit fruit = (koreaFruit)app.getBean("kfruit");
		fruit.writeFruitName();
		
		MyFruit myfruit = (MyFruit)app.getBean("myFruit");
		myfruit.writeFruit();
	}

}

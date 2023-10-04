package spring.di.ex1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("ÀÚ¹Ù?");
		MessageInter m1 = new Message1();
		m1.sayHello("¹Î¼ö");
		
		MessageInter m2 = new Message2();
		m1.sayHello("¿µÈñ");
		
		System.out.println("½ºÇÁ¸µ?");
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext1.xml");
		
		MessageInter m3 = (Message1)context.getBean("mesBean1");
		m3.sayHello("¹Î±Ô");
		MessageInter m4 = context.getBean("mesBean2", Message2.class);
		m4.sayHello("¼º½Å");
		
	}

}

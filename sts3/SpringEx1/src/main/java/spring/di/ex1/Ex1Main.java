package spring.di.ex1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("�ڹ�?");
		MessageInter m1 = new Message1();
		m1.sayHello("�μ�");
		
		MessageInter m2 = new Message2();
		m1.sayHello("����");
		
		System.out.println("������?");
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext1.xml");
		
		MessageInter m3 = (Message1)context.getBean("mesBean1");
		m3.sayHello("�α�");
		MessageInter m4 = context.getBean("mesBean2", Message2.class);
		m4.sayHello("����");
		
	}

}

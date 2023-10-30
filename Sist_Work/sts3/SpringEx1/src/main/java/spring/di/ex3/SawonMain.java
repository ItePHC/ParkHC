package spring.di.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SawonMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app = new ClassPathXmlApplicationContext("appContext3.xml");
		
		Sawon sw = app.getBean("Sawon", Sawon.class);
		sw.writedata();
	}

}

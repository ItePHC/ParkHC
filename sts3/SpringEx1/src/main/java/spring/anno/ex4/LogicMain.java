package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext anno1 = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		LogicController logic1 = (LogicController)anno1.getBean("Logic");
	
		logic1.insert("어노테이션 연습");
		logic1.delete("1");
	}

}

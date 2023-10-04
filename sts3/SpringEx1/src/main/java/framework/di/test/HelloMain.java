package framework.di.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("자바방식으로 hello매서드 호출하기");
		
		Hello hello1 = new Hello();
		System.out.println(hello1.getMessage());
	
		Hello hello2 = new Hello();
		System.out.println(hello2.getMessage());
		
		System.out.println(hello1 == hello2);			//false
		
		System.out.println("스프링방식으로 hello매서드 호출하기");
		//xml파일을 가져오기... 웹으로 실행시 web.xml에 설정이 되어있으므로 필요없다
		
		ApplicationContext app1 = new ClassPathXmlApplicationContext("HelloContext.xml");
		
		//Hello 객체 생성	
		Hello h1 = (Hello)app1.getBean("hello");		//방법 1
		System.out.println(h1.getMessage());
	
		Hello h2 = app1.getBean("hello", Hello.class);	//방법2
		System.out.println(h2.getMessage());
		
		System.out.println(h1==h2);						//생성 주소가 같아서 true
	}

}

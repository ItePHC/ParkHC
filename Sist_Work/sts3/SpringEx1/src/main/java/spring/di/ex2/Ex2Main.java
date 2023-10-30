package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext2.xml");
		
		//MyInfo ������ Ȯ��
		Myinfo myInfo = (Myinfo)context.getBean("myInfo");
		System.out.println(myInfo);
		System.out.println(myInfo.toString());
		
		//Person
		Person person = (Person)context.getBean("person");
		/* System.out.println(person); --(X) */
		person.writeData();
	}

}

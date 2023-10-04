package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		MysqlController cont = (MysqlController)app.getBean("mysqlc");
		
		cont.myinsert("±è¿µÁØ");
		cont.mydelete("28");
		cont.myselect("¹ÚÈñÂù");
	}

}

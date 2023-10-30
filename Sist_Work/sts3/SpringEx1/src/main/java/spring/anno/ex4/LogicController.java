package spring.anno.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("Logic")		//id가 로직이 된다

public class LogicController {
	@Autowired
	//정확한 빈의 아이디로 주입_모호성이 있는 경우에는 @Resource(name="maDao")
	DaoInter daoInter;

	/*
	 * public LogicController(Mydao dao) { this.daoInter = dao; }
	 */
	
	//insert
	public void insert(String str) {
		daoInter.insertData(str);
	}
	
	//delete
	public void delete(String str) {
		daoInter.deleteData(str);
	}
	
}



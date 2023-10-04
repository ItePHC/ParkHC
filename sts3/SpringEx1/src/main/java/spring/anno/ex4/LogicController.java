package spring.anno.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("Logic")		//id�� ������ �ȴ�

public class LogicController {
	@Autowired
	//��Ȯ�� ���� ���̵�� ����_��ȣ���� �ִ� ��쿡�� @Resource(name="maDao")
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



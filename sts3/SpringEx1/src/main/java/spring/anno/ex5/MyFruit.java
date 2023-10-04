package spring.anno.ex5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	// @Autowired	//SingleMatch�ϋ� ���
	//��Ȯ�ϰ� bean�� �̸��� �����Ϸ���?
	@Resource(name = "pfruit")
	Fruit fruit;
	
	public void writeFruit() {
		System.out.println("���� �����ϴ� ������ **");
		fruit.writeFruitName();
	}
	
}

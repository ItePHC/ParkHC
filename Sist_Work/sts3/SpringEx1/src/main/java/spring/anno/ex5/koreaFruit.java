package spring.anno.ex5;

import org.springframework.stereotype.Component;

@Component("kfruit")		//("kfruit") ���ۼ��� koreaFruit
public class koreaFruit implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("�ѱ������� ���ִ�");
	}

}

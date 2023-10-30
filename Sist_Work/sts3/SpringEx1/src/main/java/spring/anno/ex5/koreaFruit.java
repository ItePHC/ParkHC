package spring.anno.ex5;

import org.springframework.stereotype.Component;

@Component("kfruit")		//("kfruit") 미작성시 koreaFruit
public class koreaFruit implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("한국과일은 맛있다");
	}

}

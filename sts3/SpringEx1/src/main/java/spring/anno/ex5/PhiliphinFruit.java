package spring.anno.ex5;

import org.springframework.stereotype.Component;

@Component("pfruit")
public class PhiliphinFruit implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("필리핀의 구아바");
	}

}

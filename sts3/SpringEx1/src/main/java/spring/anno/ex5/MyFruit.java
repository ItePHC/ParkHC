package spring.anno.ex5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	// @Autowired	//SingleMatch일떄 사용
	//정확하게 bean의 이름을 주입하려면?
	@Resource(name = "pfruit")
	Fruit fruit;
	
	public void writeFruit() {
		System.out.println("내가 좋아하는 과일은 **");
		fruit.writeFruitName();
	}
	
}

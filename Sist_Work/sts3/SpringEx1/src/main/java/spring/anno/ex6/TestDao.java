package spring.anno.ex6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestDao {
	
	public void insert(String irum) {
		System.out.println(irum + "을(를) db에 추가함");
	}
	public void delete(String no) {
		System.out.println(no + "번 데이터 삭제");
	}
	public void select(String irum) {
		System.out.println(irum + "은(는) 군포에 사는 20대 남자임");
	}
}

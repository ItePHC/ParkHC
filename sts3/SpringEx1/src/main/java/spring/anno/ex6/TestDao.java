package spring.anno.ex6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestDao {
	
	public void insert(String irum) {
		System.out.println(irum + "��(��) db�� �߰���");
	}
	public void delete(String no) {
		System.out.println(no + "�� ������ ����");
	}
	public void select(String irum) {
		System.out.println(irum + "��(��) ������ ��� 20�� ������");
	}
}

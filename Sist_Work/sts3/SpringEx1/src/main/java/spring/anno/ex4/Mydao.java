package spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component //�ڵ����� �� ���(id�� Ŭ������,�� ù���ڸ� �ҹ��� �� myDao�� id����)
//�ڵ����� �� ��� (id�� Ŭ������, �� ù���ڸ� �ҹ��� �� maDao�� ���̵� ��)
public class Mydao implements DaoInter {

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub
		System.out.println(str+"_str�����͸� db�� �߰�����");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub
		System.out.println(num+"_num�� �ش��ϴ� ������ ��������");
	}

}


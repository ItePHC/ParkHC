package spring.mysql.mycar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {
	
	@Autowired
	private SqlSession session;
	
	String namespace = "spring.mysql.mycar.MyCarDao";
	
	public int getTotalCount() {
		return session.selectOne(namespace+".getTotalCountOfMyCar");
		/* �̸��� ��ĥ�� ������ return session.selectOne("mycar.getTotalCountOfMyCar")�� �ۼ��ص� �� */
	}
	
	//insert
	public void insertCar(MyCarDto dto) {
		session.insert("insertOfMycar", dto);
	}
	
	// list
	public List<MyCarDto> getAllCars(){
		return session.selectList("getAllListOfMyCar");
	}
	
	//delete
	public void deleteCar(String num) {
		session.delete("deleteOfMyCar", num);
	}
	
	public MyCarDto selectCar(String num) {
		return session.selectOne("selectOfMyCar", num);
	}
	
	//update
	public void updateCar(MyCarDto dto) {
		session.update("updateOfMyCar", dto);
	}
}

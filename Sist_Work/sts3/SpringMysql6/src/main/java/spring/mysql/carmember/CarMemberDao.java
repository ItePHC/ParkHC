package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfCarMember");
	}
	
	@Override
	public List<CarMemberDto> getCarMember() {
		// TODO Auto-generated method stub
		return session.selectList("getAllListOfCarMember");
	}

	@Override
	public void insertMember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfCarMember", dto);
	}

	@Override
	public void deleteMember(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfCarMember", num);
	}

	@Override
	public CarMemberDto selectMember(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("selectOfCarMember", num);
	}

	@Override
	public void updateMember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfCarMember", dto);
	}
		
}

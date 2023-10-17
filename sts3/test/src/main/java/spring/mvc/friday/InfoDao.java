package spring.mvc.friday;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao implements InfoInter {

	@Autowired
	SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("selectTotalCountOfMyInfo");
	}

	@Override
	public void insertMyInfo(InfoDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfMyInfo", dto);
	}

	/*
	 * @Override public List<InfoDto> getAllInfos() { // TODO Auto-generated method
	 * stub return session.selectList("selectAllOfMyInfo"); }
	 */

	@Override
	public InfoDto getOneInfo(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("selectOneOfMyInfo",num);
	}

	@Override
	public void updateMyInfo(InfoDto dto) {
		session.update("updateOfMyInfo", dto);
		
	}

	@Override
	public void deleteMyInfo(String num) {
		
		session.delete("deleteOfMyInfo", num);
		
	}

	@Override
	public List<InfoDto> getAllInfos(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList("selectAllOfMyInfo", map);
	}

	
}

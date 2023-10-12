package spring.mysql.carmember;

import java.util.List;

public interface CarMemberInter {
	public int getTotalCount();
	
	public void insertMember(CarMemberDto dto);
	
	public List<CarMemberDto> getCarMember();
	
	public void deleteMember(String num);
	
	public CarMemberDto selectMember(String num);
	
	public void updateMember(CarMemberDto dto);
}

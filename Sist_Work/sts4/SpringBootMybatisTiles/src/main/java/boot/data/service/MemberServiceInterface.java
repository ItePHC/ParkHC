package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInterface {
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getCheckId(String id);

	
	public String getName(String id);
//	public int loginPassCheck(Map<String, String> map) ;
	public MemberDto getDataById(String id);
	
	public int loginPassCheck(String id, String pass);
	public void deleteMember(String num);
	public void updatephoto(String num,String photo);
	public void updateMember(MemberDto dto);
	
	public MemberDto getDataByNum(String num);
}

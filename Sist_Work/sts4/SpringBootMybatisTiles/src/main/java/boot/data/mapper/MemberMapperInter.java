package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getCheckIdByNum(String id);		// ID중복검사

	public String getName(String id);
	public int loginPassCheck(Map<String, String> map) ;
	public MemberDto getDataById(String id);
	public void deleteMember(String num); 
	public void updatephoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
	
	public MemberDto getDataByNum(String num);
}

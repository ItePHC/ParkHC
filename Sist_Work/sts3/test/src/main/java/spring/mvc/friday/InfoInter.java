package spring.mvc.friday;

import java.util.List;
import java.util.Map;

public interface InfoInter { //인터페이스는 추상메서드만모음

	public int getTotalCount();
	public void insertMyInfo(InfoDto dto);
	/* public List<InfoDto> getAllInfos(); */
	public InfoDto getOneInfo(String num);
	public void updateMyInfo(InfoDto dto);
	public void deleteMyInfo(String num);
	public List<InfoDto> getAllInfos(Map<String, String> map);
}

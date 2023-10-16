package spring.mvc.friday;

import java.util.List;
import java.util.Map;

public interface InfoInter {
	
	public int getTotalCount();
	public void insertMyInfo(InfoDto dto);
	// public List<InfoDto> getAllInfos();
	public InfoDto getData(String num);
	public void updateMyInfo(InfoDto dto);
	public void deleteMyInfo(String num);
	public List<InfoDto> getAllInfos(Map<String, String>map);
}

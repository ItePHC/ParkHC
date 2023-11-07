package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReboardDto;


@Mapper
public interface ReboardMapperInter {
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<ReboardDto> getPagingList(Map<String, Object> map);
	public void insertReboard(ReboardDto dto);
	public void updatRestep(Map<String, Integer> map);
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
	
	 
}

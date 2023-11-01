package boot.data.service;

import java.util.HashMap;
import java.util.List;

import boot.data.dto.MemBoardDto;

public interface MemBoardServiceInter {
	public int getTotalCount();
	public void updatereadCount(String num);
	public void insertBoard(MemBoardDto dto);
	public MemBoardDto getData(String num);
	public int getMaxNum();
	public List<MemBoardDto> getList(int start, int perpage);
}

package spring.mvc.reboard;

import java.util.List;

public interface BoardDaoInter {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup,int restep);
	public void insertReboard(BoardDto dto);
	public List<BoardDto> getPagingList(int start,int perpage);
	public BoardDto getBoardData(int num);
	public void updateReadCount(int num);
	public int getCheckPass(int num, int pass);
	public void updateReboard(BoardDto dto);
	public void deleteReboard(int num); 
}

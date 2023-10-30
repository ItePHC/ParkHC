package data.model.service;

import java.util.List;

import data.model.dto.MarketDto;

public interface MarketServiceInter {
	
	public int getTotalCount();					//Map사용시 Map을 풀어서 입력_예시... (String num, int count, String....)
	public List<MarketDto> getAllSangpums();
	public void insertMarket(MarketDto dto);
	public MarketDto getData(String num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(String num);
}

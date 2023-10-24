package data.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
								// Service는 mapper를 보완 작성할수 있게 해줌 (편리성)		( mapper < Service )
@Service						// interface만으로는 자바를 사용하지 못하므로 자바를 사용하기위해 class를 만들며 interface를 implememt함
public class MarketService implements MarketServiceInter {
	
	@Autowired
	MarketMapperInter mapperInter;
	
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllSangpums() {
		// TODO Auto-generated method stub
		return mapperInter.getAllSangpums();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMarket(dto);
	}

	@Override
	public MarketDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateMarket(dto);
	}

	@Override
	public void deleteMarket(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteMarket(num);
	}

}

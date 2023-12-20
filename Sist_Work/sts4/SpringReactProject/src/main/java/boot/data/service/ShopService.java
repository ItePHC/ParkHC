package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ShopDto;
import boot.data.mapper.ShopMapper;

@Service  //anotation을 받는 것 > bean에 등록하는 것
public class ShopService implements ShopServiceInter {
	
	@Autowired
	private ShopMapper shopMapper;
	
	@Override
	public void insertShop(ShopDto dto) {
		// TODO Auto-generated method stub
		shopMapper.insertShop(dto);
	}

	@Override
	public List<ShopDto> getShopDatas() {
		// TODO Auto-generated method stub
		return shopMapper.getShopDatas();
	}

	@Override
	public ShopDto getData(int num) {
		// TODO Auto-generated method stub
		return shopMapper.getData(num);
	}

}

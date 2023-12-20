package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ShopDto;

@Mapper
public interface ShopMapper {

	public void insertShop(ShopDto dto);
	public List<ShopDto> getShopDatas();
	public ShopDto getData(int num);
}

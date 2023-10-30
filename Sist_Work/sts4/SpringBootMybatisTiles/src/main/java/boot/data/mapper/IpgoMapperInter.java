package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {
	
	public int getTotalCount();		//sql의 ID
	public void insertIpgo(IpgoDto dto);
	public List<IpgoDto> getAllIpgos();
}

package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.SmartDto;

@Mapper
public interface SmartMapperInter {

	public void insertSshop(SmartDto dto);
	public List<SmartDto> getAllSangpums(int num);
	public SmartDto getSdata(int num);
	public void updateSshop(SmartDto dto);
	public void deleteSshop(int num);
}

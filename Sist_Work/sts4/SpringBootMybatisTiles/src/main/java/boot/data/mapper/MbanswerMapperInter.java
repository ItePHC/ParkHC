package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MbanswerDto;

@Mapper
public interface MbanswerMapperInter {
	public void insertMbanswer(MbanswerDto dto);
	public List<MbanswerDto> getAllAnswers(String num);
	public MbanswerDto getAnswer(String idx);
	public void updateMbanswer(MbanswerDto dto);
	public void deleteMbanswer(String idx);
}

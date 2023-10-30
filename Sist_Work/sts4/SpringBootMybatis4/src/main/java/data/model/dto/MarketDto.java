package data.model.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto")				//alias를 해줌으로서 dto의 타입 지정
public class MarketDto {

	private String num;
	private int price;
	private String sang;
	private String photoname;
	private Timestamp ipgoday;
}

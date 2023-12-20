package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Alias("shop")
@Data
public class ShopDto {

	private int num;
	private int su;
	private int dan;
	
	private String sangpum;
	private String photo;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Timestamp ipgoday;
}

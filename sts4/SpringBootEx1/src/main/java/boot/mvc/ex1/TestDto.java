package boot.mvc.ex1;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// @Setter
// @Getter
// @ToString

@Data		// @Setter + @Getter + @ToString = @Data
public class TestDto {
	private String name;
	private String addr;
	
}

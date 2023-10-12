package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JsonTest2Controller {
	
	@GetMapping("/list2")
	public Map<String, String> list2()	{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("sang", "요가매트");
		map.put("price", "23000");
		map.put("color", "퍼플");
		
		return map;
	}
}

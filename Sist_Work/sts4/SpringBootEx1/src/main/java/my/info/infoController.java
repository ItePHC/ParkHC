package my.info;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class infoController {
	
	@GetMapping("/my/info")
	@ResponseBody
	public HashMap<String, String> info(){
		HashMap<String, String> map = new HashMap<>();
		map.put("name","박희찬");
		map.put("age","24");
		map.put("addr","산본");
		
		return map;
		
	}
	
	
}

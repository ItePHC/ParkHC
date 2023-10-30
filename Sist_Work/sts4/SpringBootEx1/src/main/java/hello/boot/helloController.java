package hello.boot;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {
	
	@GetMapping("/sist/hello")
	public HashMap<String, String> hello(){
		HashMap<String, String> data = new HashMap<>();
		
		data.put("message", "오늘은 Spring Boot 배우는 날");
		
		return data;
	}
}

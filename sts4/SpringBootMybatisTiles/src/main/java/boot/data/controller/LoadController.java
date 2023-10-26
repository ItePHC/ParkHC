package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoadController {

	@GetMapping("/load/map")
	public String map() {
		return "/load/map";
	}
	
}

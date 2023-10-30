package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	/* @GetMapping("/") */
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		model.addObject("name", "이효리");
		model.addObject("addr", "제주");
		
		model.setViewName("list");

		return model;
	}
	
}

package spring.mvc.munje;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.munje.dto.InfoDto;

@Controller
public class InfoController {
	
	@GetMapping("/info/form")
	public String info() {
		return "info/infoForm";
	}
	
	@PostMapping("/info/result")
	public String result(@ModelAttribute("dto") InfoDto dto) {
		return "info/infoWrite";
	}
	
	/*
	 * @GetMapping("/info/form") public ModelAndView start() { ModelAndView model =
	 * new ModelAndView();
	 * 
	 * model.setViewName("info/infoWrite"); return model;
	 * 
	 * }
	 */
}

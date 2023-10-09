package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizController {
	
	@GetMapping("/ilike/movie")
	public String movie() {
		return "process1";
	}
	
	@GetMapping("/ilike/moviename")
	public String likemovie(Model model, String moviename) {
		model.addAttribute("moviename", moviename);
		return "result1";
	}
	
	@GetMapping("school/myinfo")
	public String school() {
		return "process2";
	}
	
	@GetMapping("shop/ipgo")
	public String shop() {
		return "process3";
	}
	
	@GetMapping("myshinsang")
	public String shinsang() {
		return "process4";
	}
	
	
}

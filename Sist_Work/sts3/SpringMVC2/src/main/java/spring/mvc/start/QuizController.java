package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizController {

	@GetMapping("/happy")
	public String happy() {
		return "quiz1";
	}

	@GetMapping("/hello")
	public String hello1() {
		return "quiz2";
	}

	@GetMapping("/hello.do")
	public String hello2() {
		return "quiz3";
	}

	@GetMapping("/nice/hi")
	public String nice() {
		return "quiz4";
	}
}

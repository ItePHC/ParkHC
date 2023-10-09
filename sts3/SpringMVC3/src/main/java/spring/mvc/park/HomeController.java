package spring.mvc.park;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String start() {
		return "start";		//redirect 후 "form" 입력
	}
	
	@GetMapping("/login/form")
	public String form() {
		return "form";
	}
	
	@GetMapping("/login/read")
	public String process(Model model, @RequestParam(value = "myid") String id, @RequestParam(value = "mypass") String pass) { 
		// @RequestParam(value = myid) String myid => @RequestParam String muid => String myid : myid를 불러오는 과정 3개 전부 사용가능
		// @RequestParam(value = mypass) String pass : mypass를 pass로 바꾸는 과정
		
		model.addAttribute("id", id);		// id값을 id로 저장
		String msg = "";
		
		if(pass.equals("1234")) 
			msg = "로그인 성공";
		else
			msg = "로그인 실패";
		
		model.addAttribute("msg", msg);		//msg값을 msg로 저장 
		
		return "result";
	}
}

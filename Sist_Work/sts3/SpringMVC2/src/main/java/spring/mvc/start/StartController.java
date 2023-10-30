package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {
	
	//Start.jsp로 가기 위한 매서드(포워드)	
	
	@GetMapping("/") //pom에서 <org.springframework-version> 버전이 "5.2.9." 인지 확인
	// @RequestMapping(value = "/")
	public String start(Model model) {		// String은 포워드의 역할밖에 불가능함
		
		//model : request의 데이터를 저장하기 위한 인터페이스
		//Servelet에서 하던 request.setAttribute와 같다
		model.addAttribute("name", "김영환");
		model.addAttribute("addr", "서울시 강남구");
		
		return "start";	// "WEB-INF/day1005/start.jsp"를 의미
	}
}

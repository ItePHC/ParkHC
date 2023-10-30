package spring.mvc.park;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String start() {
		return "start";		//redirect �� "form" �Է�
	}
	
	@GetMapping("/login/form")
	public String form() {
		return "form";
	}
	
	@GetMapping("/login/read")
	public String process(Model model, @RequestParam(value = "myid") String id, @RequestParam(value = "mypass") String pass) { 
		// @RequestParam(value = myid) String myid => @RequestParam String muid => String myid : myid�� �ҷ����� ���� 3�� ���� ��밡��
		// @RequestParam(value = mypass) String pass : mypass�� pass�� �ٲٴ� ����
		
		model.addAttribute("id", id);		// id���� id�� ����
		String msg = "";
		
		if(pass.equals("1234")) 
			msg = "�α��� ����";
		else
			msg = "�α��� ����";
		
		model.addAttribute("msg", msg);		//msg���� msg�� ���� 
		
		return "result";
	}
}

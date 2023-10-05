package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {
	
	//Start.jsp�� ���� ���� �ż���(������)	
	
	@GetMapping("/") //pom���� <org.springframework-version> ������ "5.2.9." ���� Ȯ��
	// @RequestMapping(value = "/")
	public String start(Model model) {		// String�� �������� ���ҹۿ� �Ұ�����
		
		//model : request�� �����͸� �����ϱ� ���� �������̽�
		//Servelet���� �ϴ� request.setAttribute�� ����
		model.addAttribute("name", "�迵ȯ");
		model.addAttribute("addr", "����� ������");
		
		return "start";	// "WEB-INF/day1005/start.jsp"�� �ǹ�
	}
}

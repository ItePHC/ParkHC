package spring.mvc.park;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.FormDto;

@Controller
public class FormController {

	
	//myForms�� ������ ������ �Ұ�	
	@GetMapping("/data/myform")
	public String myform() {
		return "myforms";
	}

	//read1_get��� �� ����
	@GetMapping("/data/read1")
	public ModelAndView read1(String myname, int myage, @RequestParam(value = "msg", defaultValue = "HappyDay!!")String msg) {
		ModelAndView mview = new ModelAndView();
		
		//requset�� ����
		mview.addObject("name", myname);
		mview.addObject("age", myage);
		mview.addObject("msg", msg);
		
		//������
		mview.setViewName("process1");
		return	mview;
	}
	
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute FormDto dto) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("dto", dto);
		
		model.setViewName("process2");
		return model;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();
		
		String sang = map.get("sang");
		String price = map.get("price");
		
		String data = sang + "�� ������ " + price + "�Դϴ�.";
		
		model.addObject("data", data);
		
		model.setViewName("process3");
		return model;
	}
}

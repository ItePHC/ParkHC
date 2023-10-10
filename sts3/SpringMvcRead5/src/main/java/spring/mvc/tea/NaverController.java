package spring.mvc.tea;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.data.dto.ShopDto;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	@GetMapping("/form1")
	public String form1() {
		
		return "day1010/form1";
	}
	
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name, @RequestParam String gender, @RequestParam String addr) {
		
		ModelAndView model = new ModelAndView();
		//�𵨿� �־���
		model.addObject("name", name);
		model.addObject("gender", gender);
		model.addObject("addr", addr);
		//������
		model.setViewName("day1010/result1");
		
		return model;
	}
	
	@GetMapping("/form2")
	public String form2() {
		
		return "day1010/form2";
	}
	
	//@ModelAttribute : ���� �����͸� �о dto�� �ְ� model�� ����
	//�� model���� ShopDtoŸ���� ��� shopDto��� �̸����� ����
	//���� ���ٸ� �̸��� ���ϸ� @ModelAttribute("�̸�") ���� �ۼ�
	
	@PostMapping("/read2")
	public String read2(@ModelAttribute ShopDto dto) {
		
		return "day1010/result2";
	}
	
	@GetMapping("/form3")
	public String form3() {
		
		return "day1010/form3";
	}
	
	@PostMapping("/read3")
	/* ���±��� name�� Key������, �Է°��� value������*/
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("sang", map.get("sang"));
		model.addObject("color", map.get("color"));
		model.addObject("price", map.get("price"));
		model.addObject("image", map.get("image"));
		
		
		model.setViewName("day1010/result3");
		
		return model;
	}
	
}

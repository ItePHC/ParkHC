package boot.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.db.PersonDto;

@Controller
public class FormController {
	
	@GetMapping({"/form1","/sist/form1"})
	public String form1() { 
		return "form/form1";
	}
	
	@GetMapping({"/form2","/sist/form2"})
	public String form2() { 
		return "form/form2";
	}
	
	@GetMapping({"/form3","/sist/form3"})
	public String form3() { 
		return "form/form3";
	}
	
	@PostMapping({"/read1","/sist/read1"})
	public ModelAndView readform1(@RequestParam String irum, @RequestParam int java, @RequestParam int spring) {
		ModelAndView model = new ModelAndView();
		
		//저장
		model.addObject("irum", irum);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");
		return model;
	}
	
	@PostMapping({"/sist/read2","/read2"})
	public String readform2(@ModelAttribute("dto") PersonDto dto) {
		
		return "result/result2";
	}
	
	//map
	// map으로 읽을 경우 폼의 name이 key값으로, 입력값은 value
	@PostMapping({"/sist/read3","/read3"})
	public ModelAndView read3(@RequestParam HashMap<String, String> map) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("name", map.get("name"));
		model.addObject("blood", map.get("blood"));
		model.addObject("age", map.get("age"));
		
		// model.addObject("name", map.get("name"););
		
		
		model.setViewName("result/result3");
		
		return model;
	}
}

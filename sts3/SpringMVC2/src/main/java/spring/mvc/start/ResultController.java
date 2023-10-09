package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	
	@GetMapping("/apple/list.do")			//list 뒤에 .do나 다른 확장자를 붙이면 다 호출됨
	public String result1(Model model) {
		
		model.addAttribute("myname", "박희찬");
		model.addAttribute("myaddr", "경기도 군포시");
		return "result1";
	}
	
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		//ModelAndView는 request에 저장하기 위한 Model과 포워드 하기 위한 View를 합쳐놓은 클래스이다 
		ModelAndView mview = new ModelAndView();
		
		//request에 저장
		mview.addObject("java", 88);
		mview.addObject("spring", 84);
		
		//포워드 할 JSP파일 지정
		mview.setViewName("result2");
		
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView Orange() {
		ModelAndView mview2 = new ModelAndView();
		
		mview2.addObject("Sname", "아이폰 15Pro");
		mview2.addObject("Sprice", "1400000");
		mview2.addObject("Scolor", "스페이스그레이");
		
		mview2.setViewName("result3");
		
		return mview2;
	}
	
	
	
	@GetMapping("/shop/detail")
	public String resImage() {
		
		return "result4";
	}
	
	@GetMapping("/board/insert/data")
	public String WEBImage() {
		
		return "result5";
	}
}

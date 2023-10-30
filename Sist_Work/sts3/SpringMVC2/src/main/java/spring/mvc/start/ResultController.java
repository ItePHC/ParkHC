package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	
	@GetMapping("/apple/list.do")			//list �ڿ� .do�� �ٸ� Ȯ���ڸ� ���̸� �� ȣ���
	public String result1(Model model) {
		
		model.addAttribute("myname", "������");
		model.addAttribute("myaddr", "��⵵ ������");
		return "result1";
	}
	
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		//ModelAndView�� request�� �����ϱ� ���� Model�� ������ �ϱ� ���� View�� ���ĳ��� Ŭ�����̴� 
		ModelAndView mview = new ModelAndView();
		
		//request�� ����
		mview.addObject("java", 88);
		mview.addObject("spring", 84);
		
		//������ �� JSP���� ����
		mview.setViewName("result2");
		
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView Orange() {
		ModelAndView mview2 = new ModelAndView();
		
		mview2.addObject("Sname", "������ 15Pro");
		mview2.addObject("Sprice", "1400000");
		mview2.addObject("Scolor", "�����̽��׷���");
		
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

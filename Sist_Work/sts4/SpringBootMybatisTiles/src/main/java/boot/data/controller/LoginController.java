package boot.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String loginForm(HttpSession session, Model model) {
		// 폼의 아이디
		String myid = (String)session.getAttribute("myid");
		// 로그인상태 확인
		String loginok = (String)session.getAttribute("loginok");
		// 한번도 실행 안하면 null
		if(loginok == null)
			return "/login/loginform";
		else {
			// 로그인 중이면 requesty에 name 저장
			String name = service.getName(myid);
			model.addAttribute("name", name);
			
//			System.out.println("myid는 "+myid);
			
			
			return "/login/logoutform";
		}			
//			String loginok = (String)session.getAttribute("loginok");
	}
	
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id, @RequestParam String pass, @RequestParam(required = false) String cbsave, HttpSession session) {
		HashMap<String, String> map = new HashMap<>();
		int check = service.loginPassCheck(id, pass);
		
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
//			세션에 저장해놓음으로서 dto의 각각을 가져올 수 있게 됨
			MemberDto mdto = service.getDataById(id);
			
			session.setAttribute("loginphoto", mdto.getPhoto());
			
//			System.out.println("id는 "+id);
			
			
			return "redirect:main";
		} else {
			
			return "/member/passfail";			//   " / " : 현재 사용중인 레이아웃을 그대로 사용하게 함
		}
		
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}
	
}

package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
// @RestController
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/member/myinfo")
	public String info(Model model) {
		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);
		return "/member/myinfo";
	}

	@GetMapping("/member/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		List<MemberDto> list = service.getAllMembers();
		model.addObject("list", list);
		model.addObject("totalCount", list.size());

		model.setViewName("/member/memberlist");
		return model;
	}

	@GetMapping("/member/form")
	public String addform() {

		return "/member/addform";
	}

	// 아이디 체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String id) {
		Map<String, Integer> map = new HashMap<>();

		int n = service.getCheckId(id);

		map.put("count", n); // 0 or 1

		return map;
	}

	// insert(list로 가는데 admin이 아니면 gaipsuccess로 이동)
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto, HttpSession session, @RequestParam MultipartFile myphoto) {
		String path = session.getServletContext().getRealPath("/upload");
//		System.out.println(path);
		String photo = myphoto.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String Fname = sdf.format(new Date()) + "_" + photo;
		System.out.println(Fname);

		// 업로드
		try {
			myphoto.transferTo(new File(path + "\\" + Fname));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dto.setPhoto(Fname);
		service.insertMember(dto);
		return "redirect:list";
	}
	

	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num, HttpSession session) {
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = service.getDataByNum(num).getPhoto();
		File file = new File(path + "/" + photo);
		file.delete();
		
		service.deleteMember(num);
	}

	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(String num, MultipartFile photo, HttpSession session) {
		
		
		String path = session.getServletContext().getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date())+"_"+photo.getOriginalFilename();
		
		try {
			photo.transferTo(new File(path+"/"+fileName));
		
			service.updatephoto(num, fileName);	//DB사진 수정
			
			//세션사진 수정
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//나의 정보에서 삭제
	@GetMapping("/member/delMyInfo")
	@ResponseBody
	public void deleteinfo(String num, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = service.getDataByNum(num).getPhoto();
		File file = new File(path + "\\" + photo);
			System.out.println(file);	//?
		file.delete();					//?
		
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
	}
	
	@GetMapping("/member/updatemember")
	@ResponseBody
	public Map<String, String> updateinfo(MemberDto dto) {
		Map<String, String> map = new HashMap<>();
		
		service.updateMember(dto);

		return map;
	}
}

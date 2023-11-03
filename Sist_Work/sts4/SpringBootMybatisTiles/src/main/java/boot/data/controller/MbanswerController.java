package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@RestController
@RequestMapping("/mbanswer")
public class MbanswerController {
	
	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute MbanswerDto dto, HttpSession session) {
		
		//세션에 로그인 한 id
		String myid=(String)session.getAttribute("myid");
		String name = mservice.getName(myid);
		
		//dto에 담기
		dto.setMyid(myid);
		dto.setName(name);
		
		//인서트
		mapper.insertMbanswer(dto);
	}
	
	@GetMapping("/alist")
	public List<MbanswerDto> list(String num) {
		
		return mapper.getAllAnswers(num); 
	}
	
	@GetMapping("/deleteasw")
	@ResponseBody
	public void deleteanswer(@RequestParam String idx,
			HttpSession session)
	{
		
		mapper.deleteMbanswer(idx);
	}
	
	//수정창 content띄우기
	@GetMapping("/adata")
	public MbanswerDto getData(String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	
	//수정
	@PostMapping("/aupdate")
	public void aupdate(@ModelAttribute MbanswerDto dto)
	{
		mapper.updateMbanswer(dto);
	}
}

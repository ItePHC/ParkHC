package spring.mysql.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mysql.mycar.MyCarDto;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberInter inter;

	@GetMapping("/member/list")
	public String memberlist(Model model) {
		List<CarMemberDto> list = inter.getCarMember();
		// 갯수 가져오기
		int count = inter.getTotalCount();
		// request에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);

		return "carmember/memberlist";
	}

	@GetMapping("/member/insertform")
	public String insertmember() {

		return "carmember/addform";
	}

	@PostMapping("/member/insert")
	public String insert(@ModelAttribute CarMemberDto dto) {
		inter.insertMember(dto);
		return "redirect:list";
	}

	@GetMapping("/member/deleteform")
	public String delete(String num) {

		inter.deleteMember(num);
		return "redirect:list";
	}

	@GetMapping("/member/updateform")
	public String updateform(@RequestParam String num, Model model) {
		CarMemberDto dto = inter.selectMember(num);
		model.addAttribute("dto", dto);

		return "carmember/updateform";
	}

	@PostMapping("/member/update")
	public String update(@ModelAttribute CarMemberDto dto) {
		
		inter.updateMember(dto);
		return "redirect:list";
	}
	
}

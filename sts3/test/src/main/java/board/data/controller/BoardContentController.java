package board.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardContentController {

@Autowired
BoardDao dao;
	
	@GetMapping("/board/content")
	
	public String detailpage(Model model,
			@RequestParam int num,@RequestParam int currentPage)
	{

		//조회수증가
		dao.updateReadCount(num);
		
		BoardDto dto=dao.getBoardData(num);
		
		
		model.addAttribute("currentPage", currentPage);
		
		model.addAttribute("dto", dto);

		return "reboard/detailpage";
	}
	
	
}

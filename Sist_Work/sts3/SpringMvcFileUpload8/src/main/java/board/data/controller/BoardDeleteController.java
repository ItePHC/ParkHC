package board.data.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardDeleteController {

	@Autowired
	BoardDao dao;

	@GetMapping("/board/deletepassform")
	public ModelAndView upassform(@RequestParam String num, @RequestParam String currentPage) {
		ModelAndView model = new ModelAndView();

		model.addObject("num", num);
		model.addObject("currentPage", currentPage);

		model.setViewName("reboard/delpassform");
		return model;
	}

	@PostMapping("/board/deletepass")
	public ModelAndView updatepass(@RequestParam int num, @RequestParam int pass, @RequestParam int currentPage) {
		ModelAndView model = new ModelAndView();

		// 비밀번호가 맞으면 삭제, 틀린경우에는 passfail폼으로
		int check = dao.getCheckPass(num, pass);

		if (check == 1) {
			BoardDto dto = dao.getBoardData(num);

			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);

			model.setViewName("reboard/delpassform");
		} else {
			model.setViewName("reboard/passfail");
		}

		return model;
	}

	@PostMapping("board/delete")
	public String delete(@ModelAttribute BoardDto dto, @RequestParam int num, HttpSession session) {
		String photo = dao.getBoardData(dto.getNum()).getPhoto(); // 해당넘버에 해당하는 포토
		
		// 파일삭제
		if (!photo.equals("no")) // no가 아닌경우만 삭제해주기
		{
			String path = session.getServletContext().getRealPath("WEB-INF/photo");
			
			String[] pre_fName = photo.split(",");
			for (String f : pre_fName) {
				File file = new File(path + "\\" + f);
				file.delete();
			}
		}

		// db에서삭제
		dao.deleteReboard(num);
		return "redirect:list";
	}

}

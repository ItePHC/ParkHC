package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardUpdateController {

	@Autowired
	BoardDao dao;

	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(@RequestParam int num, @RequestParam int currentPage) {
		ModelAndView model = new ModelAndView();

		model.addObject("num", num);
		model.addObject("currentPage", currentPage);

		model.setViewName("reboard/updatepassform");
		return model;
	}

	@PostMapping("/board/updatepass")
	public ModelAndView updatepass(@RequestParam int num, @RequestParam int pass, @RequestParam int currentPage) {
		ModelAndView model = new ModelAndView();

		// 비밀번호가 맞으면 수정폼으로, 틀린경우에는 passfail폼으로
		int check = dao.getCheckPass(num, pass);

		if (check == 1) {
			BoardDto dto = dao.getBoardData(num);

			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);

			model.setViewName("reboard/updateform");
		} else {
			model.setViewName("reboard/passfail");
		}

		return model;
	}

	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto, @RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> uimage, HttpSession session) {

		// 실제경로
		String path = session.getServletContext().getRealPath("WEB-INF/photo");
		System.out.println(path);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String photo = "";

		if (uimage.get(0).getOriginalFilename().equals(""))
			photo = "no";
		else {

			//수정 전에 이전 사진 지우기
			String pre_photo = dao.getBoardData(dto.getNum()).getPhoto();
			
			String [] pre_fName = pre_photo.split(",");
			for(String f:pre_fName) {
				File file = new File(path + "\\" + f);
				file.delete();
			}
			
			for (MultipartFile f : uimage) {
				String fName = sdf.format(new Date()) + "-" + f.getOriginalFilename();
				photo += fName + ",";

				try {
					f.transferTo(new File(path + "\\" + fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			// photo에서 마지막 컴마 제거
			photo = photo.substring(0, photo.length() - 1);

		}


		// dto의 photo에 넣기
		dto.setPhoto(photo);
		
		dao.updateReboard(dto);

		return "redirect:content?num=" + dto.getNum() + "&currentPage=" + currentPage;
	}

}

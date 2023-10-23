package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "redirect:market/list";
	}

	@GetMapping("/market/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		// db로부터 총 개수 얻기
		int totalCount = mapper.getTotalCount();

		List<MarketDto> list = mapper.getAllSangpums();
		
		// 저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		// 포워드
		model.setViewName("market/marketlist");

		return model;
	}

	@GetMapping("/market/writeform")
	public String carinsert() {
		return "market/addform";
	}

	@PostMapping("/market/add")
	public String insert(@ModelAttribute MarketDto dto, MultipartFile upload, HttpSession session) {
		// 업로드 할 save 위치 구하기
		String path = session.getServletContext().getRealPath("/save");

		String photo = "";
		if (upload.getOriginalFilename().equals(""))
			photo = "no";
		else {
			String fname = upload.getOriginalFilename();
			photo = fname;

			try {
				upload.transferTo(new File(path + "\\" + photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		dto.setPhotoname(photo);
		
		mapper.insertMarket(dto);
		return "redirect:list";
	}
}

package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

	/*
	 * @Autowired MarketMapperInter mapper;
	 */
	@Autowired
	MarketService service;

	@GetMapping("/")
	public String start() {
		return "redirect:market/list";
	}

	@GetMapping("/market/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();

		// db로부터 총 개수 얻기
		int totalCount = service.getTotalCount();

		List<MarketDto> list = service.getAllSangpums();
		
		// 저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		// 포워드
		model.setViewName("market/marketlist");

		return model;
	}

	@GetMapping("/market/writeform")
	public String marketinsert() {
		return "market/addform";
	}

	@PostMapping("/market/add")
	public String insert(@ModelAttribute MarketDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		// 업로드 할 save 위치 구하기
		String path = session.getServletContext().getRealPath("/save");
		String fname = upload.getOriginalFilename();
		
		String photo = "";
		
		if (fname.equals(""))
			photo = "no";
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			photo = sdf.format(new Date())+fname;
			
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
		service.insertMarket(dto);
		return "redirect:list";
	}
	
	@GetMapping("/market/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		MarketDto dto = service.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("market/uform");
		return model;
	}
	
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto,  @RequestParam MultipartFile upload, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/save");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String photo;
		
		if (upload.getOriginalFilename().equals(""))
			photo = null;
		else {
			photo = upload.getOriginalFilename();
			photo = sdf.format(new Date())+photo;	
			System.out.println(photo);
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
		service.updateMarket(dto);
		return "redirect:list";
	}
	
	
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num, HttpSession request) {
		
		String photo = service.getData(num).getPhotoname();
		
		if(!photo.equals("no")) {
			String path = request.getServletContext().getRealPath("/save");
			
			File file = new File(path + "\\" + photo);
			file.delete();
		}
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
}

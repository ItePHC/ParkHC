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

import data.model.dto.MovieDto;
import data.model.mapper.MovieMapperInter;

@Controller
public class MovieController {

	@Autowired
	MovieMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "redirect:movie/list";
	}
	
	
	@GetMapping("/movie/insert")
	public String insertform() {
		return "movie/addform";
	}
	
	@PostMapping("/movie/add")
	public String insert(@ModelAttribute MovieDto dto, MultipartFile upload, HttpSession session) {
		//업로드 할 save 위치 구하기
		String path = session.getServletContext().getRealPath("/save");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		//업로드한 파일의 dto얻기
		String poname = upload.getOriginalFilename();

		if (poname.equals(""))
			poname = "no";
		else {
			poname = sdf.format(new Date())+poname;
			try {
				upload.transferTo(new File(path+"\\"+poname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		dto.setMv_poster(poname);
		mapper.insertMovie(dto);
		return "redirect:list";
	}
	
	@GetMapping("/movie/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		int totalCount = mapper.getTotalMovie(); 
		List<MovieDto> list = mapper.getAllMovies();
		
		// 저장
		model.addObject("list", list);
		
		// 포워드
		model.addObject("totalCount", totalCount);
		model.setViewName("movie/movielist");  
		return model;
	}
	
	@GetMapping("/movie/detail")
	public ModelAndView detail(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		MovieDto dto = mapper.getMovie(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("movie/detail");
		return model;
	}
}

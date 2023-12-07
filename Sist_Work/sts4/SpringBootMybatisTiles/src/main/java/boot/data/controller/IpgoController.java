package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "/layout/main";			// Tiles에서 /*/* 형태로 정의해서 /layout/main 으로 작성
	}

	
	  @GetMapping("/ipgo/list") 
	  public ModelAndView list() { ModelAndView model = new ModelAndView();
	  
	  List<IpgoDto> list = mapper.getAllIpgos(); 
	  int totalCount = mapper.getTotalCount();
	  
	  model.addObject("totalCount", totalCount); 
	  model.addObject("list", list);
	  
	  model.setViewName("/Ipgo/ipgolist"); 
	  return model; 
	  }
	 
	
	
	 @GetMapping("/ipgo/ipgoform") 
	 public String form() {
		 
		 return "/Ipgo/ipgoform"; 
		 }
	 
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto, @RequestParam ArrayList<MultipartFile> file,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/upload");
		 System.out.println(path);
		
		 String uploadFileName = "";
		
		
		if(file.get(0).getOriginalFilename().equals(""))
			uploadFileName = "no";
		else {
			for(MultipartFile f : file) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String fName = sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadFileName += fName + ",";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			// photo 마지막 , 제거
			uploadFileName.substring(0, uploadFileName.length()-1);
		}
		dto.setPhotoname(uploadFileName);
		mapper.insertIpgo(dto);
		return "redirect:/Ipgo/ipgolist";
	}
}

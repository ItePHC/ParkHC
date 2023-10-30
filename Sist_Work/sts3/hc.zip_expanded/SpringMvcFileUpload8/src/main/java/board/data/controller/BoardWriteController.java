package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

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
public class BoardWriteController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/writeform")
	public ModelAndView form(@RequestParam Map<String, String> map) 
	{
		ModelAndView model=new ModelAndView();
		
		//�� 5���� ����� ��쿡�� �Ѿ�´�(�����ϰ�� �ȳѾ��)
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		System.out.println(currentPage+","+num);
		
		//�Է����� hidden���� �־������..����϶� ���
		model.addObject("currentPage", currentPage==null?"1":currentPage);
		model.addObject("num", num==null?"0":num); 
		model.addObject("regroup", regroup==null?"0":regroup);
		model.addObject("restep", restep==null?"0":restep);
		model.addObject("relevel", relevel==null?"0":relevel);
		
		//0���� �־�� dao���� ���۷� �ν�
		//���� ���,���� �����̹Ƿ�
		
		model.setViewName("reboard/writeform");
		return model;
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session,
			@RequestParam int currentPage)
	{
		//�������
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		
		String photo="";
		
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			
			for(MultipartFile f:uimage)
			{
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fName+",";
				
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
			
			//photo���� ������ �ĸ� ����
			photo=photo.substring(0, photo.length()-1);
		}
		
		//dto�� photo�� �ֱ�
		dto.setPhoto(photo);
		
		//insert
		dao.insertReboard(dto);
		
		int num=dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+currentPage; //content�ϴ� �����ϱ� �������
		
	}
	
	
	
}

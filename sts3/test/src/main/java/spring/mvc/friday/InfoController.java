package spring.mvc.friday;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class InfoController {

	@Autowired
	InfoInter inter;
	
	//list
	@GetMapping("/info/list")
	/* Required String parameter 'title' is not present 기본값 줘야함*/ 
	public String Infolist(Model model,@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search)
	{
		
		int totalcount=inter.getTotalCount();
		/* List<InfoDto> list= inter.getAllInfos(); */
		
		System.out.println(title+","+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search); //모델로 안넘겨도됨
		map.put("title", title);
		
		List<InfoDto> list=inter.getAllInfos(map);
		
		model.addAttribute("totalcount", totalcount);
		model.addAttribute("list", list);
		
		
		return "info/infolist";
	}
	
	//insert
	@GetMapping("/info/addform")
	public String addform()
	{
		return "info/addform";
	}
	
	@PostMapping("/info/add")
	public String add(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
	
		String path=session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//사진선택을 안했을경우 no..
		if(upload.getOriginalFilename().equals(""))
			//photo=null;
			photo="no";
		else {
			
			String fName=upload.getOriginalFilename();
			fName=sdf.format(new Date())+"_"+fName;
			photo=fName;
			//업로드
			try {
				upload.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//dto의 photo에 넣기
		dto.setPhoto(photo);
		
		//insert
		inter.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	//update
	@GetMapping("/info/uform")
	public String uform(@RequestParam String num,Model model)
	{
		InfoDto dto=inter.getOneInfo(num);
		model.addAttribute("dto", dto);
		
		return "info/updateform";
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo2=inter.getOneInfo(dto.getNum()).getPhoto();
		
		String photoname; //dto에 담을 변수
	
		
		//사진선택안할경우 null
		if(upload.getOriginalFilename().equals(""))
			photoname=null;
		else {
			photoname=upload.getOriginalFilename();
			photoname=sdf.format(new Date())+"_"+photoname;
			
			File file=new File(path+"\\"+photo2);
			file.delete();
			
			//upload
			try {
				upload.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		//dto의 photo에 업로드한 photoname
		dto.setPhoto(photoname);
		
		//update
		inter.updateMyInfo(dto);
		
		return "redirect:list";
	
	}
	
	//delete
	@GetMapping("info/delete")
	public String delete(@RequestParam String num,HttpSession session)
	{
		String photo=inter.getOneInfo(num).getPhoto(); //해당넘버에 해당하는 포토
		
		//파일삭제
		if(!photo.equals("no")) //no가 아닌경우만 삭제해주기
		{
			String path=session.getServletContext().getRealPath("/resources/image");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		//db에서삭제
		inter.deleteMyInfo(num);
		return "redirect:list";
	}
	
}

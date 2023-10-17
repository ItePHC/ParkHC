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
	/* Required String parameter 'title' is not present �⺻�� �����*/ 
	public String Infolist(Model model,@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search)
	{
		
		int totalcount=inter.getTotalCount();
		/* List<InfoDto> list= inter.getAllInfos(); */
		
		System.out.println(title+","+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search); //�𵨷� �ȳѰܵ���
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
		
		//���������� ��������� no..
		if(upload.getOriginalFilename().equals(""))
			//photo=null;
			photo="no";
		else {
			
			String fName=upload.getOriginalFilename();
			fName=sdf.format(new Date())+"_"+fName;
			photo=fName;
			//���ε�
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
		
		//dto�� photo�� �ֱ�
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
		
		String photoname; //dto�� ���� ����
	
		
		//�������þ��Ұ�� null
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
		
		
		
		//dto�� photo�� ���ε��� photoname
		dto.setPhoto(photoname);
		
		//update
		inter.updateMyInfo(dto);
		
		return "redirect:list";
	
	}
	
	//delete
	@GetMapping("info/delete")
	public String delete(@RequestParam String num,HttpSession session)
	{
		String photo=inter.getOneInfo(num).getPhoto(); //�ش�ѹ��� �ش��ϴ� ����
		
		//���ϻ���
		if(!photo.equals("no")) //no�� �ƴѰ�츸 �������ֱ�
		{
			String path=session.getServletContext().getRealPath("/resources/image");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		//db��������
		inter.deleteMyInfo(num);
		return "redirect:list";
	}
	
}

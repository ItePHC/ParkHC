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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {

	@Autowired
	InfoInter inter;
	
	@GetMapping("/info/list")
	public ModelAndView list(@RequestParam(defaultValue = "name") String title, @RequestParam(required = false) String search) {
		ModelAndView model = new ModelAndView();
		
		int totalCount = inter.getTotalCount();
		
		System.out.println(title + ", " + search);;
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		model.addObject("totalCount", totalCount);
		
		List<InfoDto> list = inter.getAllInfos(map);
		// model.addObject("list", list);
		// model.addObject("search", search);
		// model.addObject("title", title);
		
		
		model.setViewName("info/infolist");
		
		return model;
	}
	
	@GetMapping("/info/addform")
	public String insertInfo() {
		
		return "info/addform";
	}
	
	@PostMapping("/info/insert")
	public String insert(@ModelAttribute InfoDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/image");
		/* System.out.println(path); */
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo = "";
		
		//���� ������ ������ ��� No
		if(upload.getOriginalFilename().equals("")) {
			/*null;*/
			photo="no";
		}else {
				String fName=upload.getOriginalFilename();
				fName=sdf.format(new Date()) + "_" + fName;		//�����̸� �տ� ���� ��¥�� �ð��� �߰��Ͽ� �̹����� ��ġ�� �ʰ� ����
				photo=fName;
			}
		
		//���ε�  (upload.transferTo(new File(path+"\\"+photo));)
		//������ Try/Catch ����� ��
		try {
			upload.transferTo(new File(path+"\\"+photo));		//������ �����ϰ� ���� ������ ������ ���ε�
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//dto�� photo�� �ֱ�
		dto.setPhoto(photo);
		
		//insert  (�ݵ�� dto�� photo�� ���� �� insert �Ұ�)
		inter.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/uform")
	public String uform(@RequestParam String num, Model model) {
		InfoDto dto = inter.getData(num);
		model.addAttribute("dto", dto);
		
		return "info/updateform";
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute InfoDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/image");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String photoname = "";
		
		//���� ������ ������ ��� No
		if(upload.getOriginalFilename().equals("")) {
			/*null;*/
			photoname=null;
		}else {
			photoname=upload.getOriginalFilename();
			photoname=sdf.format(new Date()) + "_" + photoname;		//�����̸� �տ� ���� ��¥�� �ð��� �߰��Ͽ� �̹����� ��ġ�� �ʰ� ����
		
		try {
			upload.transferTo(new File(path+"\\"+photoname));		//������ �����ϰ� ���� ������ ������ ���ε�
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		//dto�� photo�� �ֱ�
		dto.setPhoto(photoname);
		

		inter.updateMyInfo(dto);
		return "redirect:list";
	}
	
	
	@GetMapping("/info/delete")
	public String delete(@RequestParam String num, HttpSession session) {
		String photo = inter.getData(num).getPhoto();
		
		if(!photo.equals("no")) {
			//�����ο� �����ϴ� �̹��� ���� ����
			String path = session.getServletContext().getRealPath("/resources/image");
			
			File file =new File(path + "\\" + photo);
			file.delete();
		}
		inter.deleteMyInfo(num);
		
		return "redirect:list";
	}
	
	
}

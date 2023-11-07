package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
@RequestMapping("/reboard")
public class ReBoardController {
	
	@Autowired
	ReboardService service;
	
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(value = "searchcolumn", required = false) String sc, @RequestParam(value = "searchword", required = false) String sw) {
		ModelAndView model = new ModelAndView();
		
		// 페이징에 필요한 변수
		int totalCount = service.getTotalCount(sc, sw);
		int totalPage; // 총 페이지수
		int startPage; // 각블럭에서 보여질 시작페이지
		int endPage; // 각블럭에서 보여질 끝페이지
		int startNum; // db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage = 5; // 한페이지당 보여질 글의 갯수
		int perBlock = 5; // 한블럭당 보여질 페이지 개수
		
		// 총페이지수 구하기
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		
		// 각블럭당 보여야할 시작페이지
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		
		endPage = startPage + perBlock - 1;
		
		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다
		if (endPage > totalPage)
			endPage = totalPage;
		
		// 각페이지에서 보여질 시작번호
		startNum = (currentPage - 1) * perPage;
		
		// 각페이지에서 필요한 게시글 가져오기
		List<ReboardDto> list = service.getPagingList(sc, sw, startNum, perPage);


		// 각 페이지에 출력할 시작번호
		int no = totalCount - (currentPage - 1) * perPage;
			
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		System.out.println("totalCount = " + totalCount);
		
		model.setViewName("/reboard/boardlist");
		return model;
	}
	
	@GetMapping("/form")
	public String  reform(@RequestParam(defaultValue = "0") int num, @RequestParam(defaultValue = "0") int regroup, @RequestParam(defaultValue = "0") int restep, @RequestParam(defaultValue = "0") int relevel, @RequestParam(defaultValue = "1") int currentPage, Model model) {
		// 답글일 경우에만 넘어오는 값들이다x
		
		// 새 글일 경우에는 모두 null이므로 defaultValue만 값으로 전달된다
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		// 새 글일 경우에는 "", 답글일 경우에는 원글 제목 가져오기
		String subject = "";
		if(num>0) {
			subject = service.getData(num).getSubject();			// ?
		}
		model.addAttribute("subject", subject);
		
		return "/reboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReboardDto dto, ArrayList<MultipartFile> upload, HttpSession session) {
		String path = session.getServletContext().getRealPath("/rephoto");
		String uploadFileName = "";
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadFileName="no";
		else {
			for(MultipartFile f:upload) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String fName = sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadFileName += fName+",";
				
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
			uploadFileName = uploadFileName.substring(0, uploadFileName.length()-1);
		}
		dto.setPhoto(uploadFileName);
		
		service.insertReboard(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/content")
	public String detail(int num, int currentPage,Model model) {
		// 조회수 증가
		service.updateReadCount(num);
		
		ReboardDto dto = service.getData(num);
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "/reboard/content";
	}
	
	//추천수 증가
	@GetMapping("likes")
	@ResponseBody
	public Map<String, Integer> likes(@RequestParam int num){
		Map<String, Integer> map = new HashMap<>();
		int likes = service.getData(num).getLikes();
		
		map.put("likes",likes);
		
		service.updateLikes(num);
		return map;
	}
	
	
	
}

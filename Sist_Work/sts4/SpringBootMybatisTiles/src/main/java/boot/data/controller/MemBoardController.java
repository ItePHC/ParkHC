package boot.data.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.service.MemBoardService;
import boot.data.service.MemberService;

@Controller
@RequestMapping("/memboard")
public class MemBoardController {
	
	@Autowired
	MemBoardService service;
	
	@Autowired
	MemberService mservice;
	
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount();
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
		List<MemBoardDto> list = service.getList(startNum, perPage);


		// 각 페이지에 출력할 시작번호
		int no = totalCount - (currentPage - 1) * perPage;
			
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/memboard/memlist");
		return model;
	}
	
	@GetMapping("/form")
	public String form() {
		
		return "/memboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemBoardDto dto,  HttpSession session) {
		String path = session.getServletContext().getRealPath("/savefile");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("NoFile");
		// 업로드 한 경우
		else {
			String file = dto.getUpload().getOriginalFilename();
			
			String uploadFile = sdf.format(new Date()) + "_" +  file;
			
			dto.setUploadfile(uploadFile);
			
			// 실제 업로드
			try {
				dto.getUpload().transferTo(new File(path+"/"+uploadFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 아이디 얻어서 dto에 저장
		String myid = (String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//이름 구하기
		String name = mservice.getName(myid);
		dto.setName(name);
		
		//insert
		service.insertBoard(dto);
		
		//현재 작성한 글로 이동
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		
		//조회수 증가
		service.updatereadCount(num);
		
		MemBoardDto dto = service.getData(num);	
		model.addObject("dto", dto);
		
		
		//업로드 파일의 확장자 얻기
		int dotLoc=dto.getUploadfile().lastIndexOf('.');	//마지막 점의 위치
		String ext = dto.getUploadfile().substring(dotLoc+1);			// 마지막 점의 위치에서 +1인 위치부터 끝까지 추출
		
		System.out.println(dotLoc + "//" + ext);
		// 이미지 출력방식을 조건으로 걸고 그 외의 것은 이미지 출력 안함
		if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("jpeg")||ext.equalsIgnoreCase("gif")||ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jfif"))
			model.addObject("bupload",true);
		else
			model.addObject("bupload",false);
			
		model.setViewName("/memboard/content");
		return model;
	}
	
}

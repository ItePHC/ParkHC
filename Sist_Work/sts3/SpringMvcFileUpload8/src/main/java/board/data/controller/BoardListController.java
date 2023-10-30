package board.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardListController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/list")
	public ModelAndView boardlist(
			@RequestParam(value = "currentPage",defaultValue = "1") int currentPage
		
			)
	{
		ModelAndView model=new ModelAndView();

		//페이징처리에 필요한 변수선언
		int totalCount=dao.getTotalCount(); //전체갯수
		int totalPage; //총 페이지
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=5; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	  	
	  	//각블럭당 보여야할 시작페이지
	  	//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
	  	//현재페이지 13  시작:11  끝:15
	  	startPage=(currentPage-1)/perBlock*perBlock+1;
	       
	  	endPage=startPage+perBlock-1;

		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;
		
		//각페이지에서 필요한 게시글 가져오기
		List<BoardDto> list=dao.getPagingList(startNum, perPage);
		//각페이지에서 보여질 시작번호	
		int no=totalCount-(currentPage-1)*perPage;
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		

		model.setViewName("reboard/boardlist");
		return model;
	}
	
	
}

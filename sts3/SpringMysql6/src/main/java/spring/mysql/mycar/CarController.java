package spring.mysql.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarController {
	
	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model model) {
		//dao로부터 총 개수 받아오기
		int totalCount = dao.getTotalCount();
		
		//목록 가져오기
		List<MyCarDto> list = dao.getAllCars();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	@GetMapping("/kakao/writeform")
	public String carform() {
		
		return "car/writeform";
	}
	
	//insert
	@PostMapping("/kakao/write")
	public String insert(@ModelAttribute MyCarDto dto) {
		
		dao.insertCar(dto);
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/kakao/deleteform")
	public String delete(String num) {
		
		dao.deleteCar(num);
		return "redirect:list";
	}
	
	@GetMapping("/kakao/updateform")
	public String updateform(@RequestParam("num") String num , Model model) {
	  	MyCarDto dto = dao.selectCar(num); 
	  	model.addAttribute("dto", dto);
	  	
	  	return "car/updateform"; 
	  	}	
	
	
	
	/*
	  	@GetMapping("/kakao/updateform")
	 	public String updateform(@RequestParam("num") String num , Model model) {
	  	MyCarDto dto = dao.selectCar(num); 
	  	model.addAttribute("dto", dto);
	  	return "car/updateform"; }	
	 */
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute MyCarDto dto) {

		dao.updateCar(dto);
		return "redirect:list";
	}
}

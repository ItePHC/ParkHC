package answer.data;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class AnswerController {

	@Autowired
	AnswerDao adao;

	@PostMapping("/board/ainsert")
	public String answerinsert(@ModelAttribute AnswerDto dto, @RequestParam int currentPage) {
		
		/* System.out.println(currentPage); */
		// db√ﬂ∞°
		adao.insertAnswer(dto);

		return "redirect:content?num=" + dto.getNum() + "&currentPage=" + currentPage;
	}
	
	@PostMapping("/board/adelete")
	public String answerdelete(@ModelAttribute AnswerDto dto, @RequestParam String pass, @RequestParam int currentPage) {
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	
}

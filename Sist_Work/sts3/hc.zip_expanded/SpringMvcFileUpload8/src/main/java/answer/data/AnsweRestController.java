package answer.data;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AnsweRestController {

	@Autowired
	AnswerDao adao;
	
	@GetMapping("/board/adelete")
	public HashMap<String, Integer> answerDelete(@RequestParam String pass, @RequestParam int idx){
		int check = adao.getCheckPass(idx, pass);
		if(check==1) {
			adao.deleteAnswer(idx);
		} else {
			
		}
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check);		//{"check":1}
		
		return map;
	}
}

package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {
	
	@GetMapping("/list1")
	@ResponseBody //json���� ó���� ��ȯ
	public Map<String, String> list1()	{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", "�����");
		map.put("hp", "010-1234-5678");
		map.put("addr", "��⵵ ������");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3(){
		
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("1", "toy01.png"));
		list.add(new PhotoDto("2", "toy02.png"));
		list.add(new PhotoDto("3", "toy03.png"));
		list.add(new PhotoDto("Pig", "toy04.png"));
		list.add(new PhotoDto("5", "toy05.png"));
		
		return list;
	}
}

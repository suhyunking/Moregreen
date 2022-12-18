package site.moregreen.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class MainController {
	@GetMapping("/index")
	public String index() {
//		빌드 테스트1
		return "/index";
	}
}

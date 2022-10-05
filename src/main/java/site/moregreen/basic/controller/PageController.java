package site.moregreen.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class PageController {
		
	@GetMapping("/dashboard")
	public String dashborad() {
		return "pages/dashboard";
	}
	
	@GetMapping("/notifications")
	public String notifications() {
		return "pages/notifications";
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "pages/profile";
	}
	
	@GetMapping("/signIn")
	public String signIn() {
		return "pages/signIn";
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		return "pages/signUp";
	}
	
	@GetMapping("/faq")
	public String faq() {
		return "pages/faq";
	}
	
	@GetMapping("/aboutme")
	public String aboutme() {
		return "pages/aboutme";
	}
}

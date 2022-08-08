package com.tuttigram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/signin/view")
	public String signinView() {
		return "user/signin";
	}

	
	@GetMapping("/user/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	
	
	
	
}

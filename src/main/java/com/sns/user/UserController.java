package com.sns.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	
	// 회원가입
	// URL : http://localhost:8080/user/sign-up-view
	@GetMapping("/sign-up-view")
	public String signUpView(Model model) {
			
		model.addAttribute("viewName", "user/signUp");	// layout은 고정이 되고, 중간 내용만 바뀌게 됨
			
		return "template/layout";
		
	}
	
	
	
	// 로그인
	// URL : http://localhost:8080/user/sign-in-view
	@GetMapping("/sign-in-view")
	public String signInView(Model model) {
		
		model.addAttribute("viewName", "user/signIn");
		
		return "template/layout";
		
	}
	
	
	
	// 로그아웃
	@RequestMapping("/sign-out")
	public String signOut(HttpSession session) {
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/sign-in-view";
		
	}
	
	

}

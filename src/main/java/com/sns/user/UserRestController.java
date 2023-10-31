package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	
	@Autowired
	private UserBO userBO;
	
	
	// 로그인 아이디 중복 확인 API
	// URL : http://localhost:80/user/sign-up-view
	
	
	
	
	
	
	
	
	
	
	
	// 회원가입
	@PostMapping("/sign-up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		// password 해싱 (암호화 -> 복호화 불가능) - md5 알고리즘
		String hashedPassword = EncryptUtils.md5(password);
		
		// DB insert
		Integer userId = userBO.addUser(loginId, hashedPassword, name, email);
		
		// 응답값
		Map<String, Object> result = new HashMap<>();
		
		if (userId != null) {
			
			result.put("code", 200);
			result.put("result", "성공");
			
		} else {
			
			result.put("code", 500);
			result.put("errorMessage", "회원가입 하는데 실패했습니다");
		}
		
		return result;
		
	}
	
	
	
	
	
	
	

}

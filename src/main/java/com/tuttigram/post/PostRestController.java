package com.tuttigram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuttigram.post.bo.PostBO;

@Controller
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	
	// 글쓰기
	@PostMapping("/post/create")
	public Map<String, String> commentCreate(
			@RequestParam("content") String content
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		
		int count = postBO.addPost(userId, content);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

}

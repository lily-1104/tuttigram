package com.tuttigram.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	
	
	// 좋아요
//	@GetMapping("/post/like")
//	public Map<String, String> like(
//			@RequestParam("postId") int postId
//			, HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer) session.getAttribute("userId");
//		
//		Map<String, String> map = new HashMap<>();
		
//		int count = likeBO.addlike(postId, userId);
		
//		if(count == 1) {
//			map.put("result", "success");
//			
//		} else {
//			map.put("result", "fail");
//		}
		
		
		
//	}
	
	
	
}

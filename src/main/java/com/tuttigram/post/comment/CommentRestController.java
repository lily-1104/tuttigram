package com.tuttigram.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tuttigram.post.comment.bo.CommentBO;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	
	
	// 댓글 입력 
	@PostMapping("/post/comment/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
				// session으로 userId 얻어오기
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Map<String, String> map = new HashMap<>();
		
//		int count = commentBO.addComment(postId, userId, content);
		
//		if (count == 1) {
//			map.put("result", "success");
//			
//		} else {
//			map.put("result", "fail");
//		}
		
		return map;
		
	}

}

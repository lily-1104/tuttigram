package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	
	@Autowired
	private PostBO postBO;
	
	
	// 게시글 업로드 API
	@PostMapping("/create")
	public Map<String, Object> create (
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		// session에 들어있는 user id 꺼내기
		Integer userId = (Integer) session.getAttribute("userId");	// 로그인이 안되어있으면 에러남
		String userLoginId = (String) session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		if (userId == null) {
			
			result.put("code", 500);	// 비로그인 상태
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
			
			return result;
			
		}
		
		postBO.addPost(userId, userLoginId, content, file);
		
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
		
	}
	

}

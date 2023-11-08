package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	
	@Autowired
	private LikeBO likeBO;
	
	
	// 좋아요
	// get : /like?postId=13   =>   @RequestParam("postId")
	// get : /like/13          =>	 @PathVariable
	@RequestMapping("/like/{postId")	// get, post 전부 허용이라 RequestMapping 사용
	public Map<String, Object> likeToggle(
			@PathVariable int postId,
			HttpSession session) {
		
		// 로그인 여부 확인
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {
			
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요.");
			
			return result;
		}
		
		
		// 로그인 되어있으면 BO 호출 -> like 여부 체크
//		likeBO.likeToggle(postId, userId);
		
		// 응답값
		result.put("code", 200);
		result.put("result", "성공");
		return result;
		
	}

}

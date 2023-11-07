package com.sns.like;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	
	
	// 좋아요
	// get : /like?postId=13   =>   @RequestParam("postId")
	// get : /like/13          =>	 @PathVariable
	@RequestMapping("/like/{postId")	// get, post 전부 허용이라 RequestMapping 사용
	public Map<String, Object> likeToggle(
			@PathVariable int postId,
			Httpsession session) {
		
		// 로그인 여부 확인
		
		
		// 로그인 되어있으면 BO 호출 -> like 여부 체크
//		likeBO.likeToggle(파라미터들);
		
		// 응답값
		
		
		
	}

}

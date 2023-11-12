package com.sns.post.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository	
public interface PostMapper {
	
	
	// TestController
	public List<Map<String, Object>> selectPostList();
	
	
	
	// 글 삭제 API
	public void deletePostByPostIdUserId
	

}

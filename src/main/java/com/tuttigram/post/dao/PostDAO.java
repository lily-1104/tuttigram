package com.tuttigram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tuttigram.post.model.Post;

@Repository
public interface PostDAO {
	
	
	// 글 쓰기
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
				// DAO 에서는 imagePath 파라미터 사용!
	
	
	
	// 게시물 업로드
	public List<Post> selectPostList();
	
	
}

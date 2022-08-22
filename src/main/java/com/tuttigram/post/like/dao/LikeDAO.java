package com.tuttigram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	
	// 좋아요
	public int insertLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	
	
	// postId로 좋아요 개수 조회
	public int selectCountLike(@Param("postId") int postId);
}

package com.tuttigram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	
	// 좋아요
	public int insertLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	
	
	// 좋아요 취소 api
	public int deleteLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	
	
	// postId로 좋아요 개수 조회
	public int selectCountLike(@Param("postId") int postId);
	
	
	
	// 해당하는 postId의 좋아요 모두 삭제
	public int deleteLikeByPostId(@Param("postId") int postId);
	
}

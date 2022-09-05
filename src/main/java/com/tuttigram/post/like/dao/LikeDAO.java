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
	
	
	
	// postId와 userId가 모두 일치하는 행의 개수
		// dao를 만들 때에는 최대한 어떤 기능을 위한 쿼리인지 모르게 하는게 좋음, 필요한 쿼리에 대한 것만 정의 
	public int selectCountLikeByPostUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	
	
	// 해당하는 postId의 좋아요 모두 삭제
	public int deleteLikeByPostId(@Param("postId") int postId);
	
	
}

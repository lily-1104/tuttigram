package com.tuttigram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tuttigram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("content") String content);
	
	
	
	// post id를 대상으로 해당되는 댓글 들을 조회하는 기능 
	public List<Comment> selectCommentListByPostId(@Param("postId") int postId);  
	
	
	
	// 해당하는 postId의 모든 댓글 삭제
	public int deleteComment(@Param("postId") int postId);
}

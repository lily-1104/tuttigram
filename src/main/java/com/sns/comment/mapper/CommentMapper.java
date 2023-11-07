package com.sns.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.comment.domain.Comment;

@Repository	
public interface CommentMapper {
	
	
	// 댓글 쓰기
	public void insertComment(
			@Param("postId") int postId, 
			@Param("userId") int userId, 
			@Param("content") String content);
	
	
	// 게시글 댓글 조회
	public List<Comment> selectCommnetListByPostId(int postId);
	
	
	
	// 댓글 삭제 (로그인이 되어있을 때)
	public void deleteCommentById(int id);
	
	
}

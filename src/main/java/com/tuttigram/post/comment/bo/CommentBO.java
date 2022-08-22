package com.tuttigram.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.post.comment.dao.CommentDAO;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
//	public int addComment (int postId, int userId, String content) {
		
//	}
	
	
	
	// 해당하는 postId의 모든 댓글 삭제
	public int deleteComment(int postId) {
		
		return commentDAO.deleteComment(postId);
	}

}

package com.tuttigram.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.post.comment.dao.CommentDAO;
import com.tuttigram.post.comment.model.Comment;
import com.tuttigram.post.comment.model.CommentDetail;
import com.tuttigram.user.bo.UserBO;
import com.tuttigram.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	
	public int addComment (int postId, int userId, String content) {
		
		return commentDAO.insertComment(postId, userId, content);
	}
	
	
	
	// post id를 대상으로 해당되는 댓글 들을 조회하는 기능 
	public List<CommentDetail> getCommentListByPostId(int postId) {	  // model로 임포트
		
		List<Comment> commentList = commentDAO.selectCommentListByPostId(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment : commentList) {
			
			int userId = comment.getUserId();
			User user = userBO.getUserById(userId);
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setComment(comment);
			commentDetail.setUser(user);
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
	
	
	
	// 해당하는 postId의 모든 댓글 삭제
	public int deleteComment(int postId) {
		
		return commentDAO.deleteComment(postId);
	}

}

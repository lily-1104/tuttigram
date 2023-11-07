package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.domain.Comment;
import com.sns.comment.domain.CommentView;
import com.sns.comment.mapper.CommentMapper;
import com.sns.user.bo.UserBO;
import com.sns.user.entity.UserEntity;

@Service
public class CommentBO {
	
	
	@Autowired
	private CommentMapper commentMapper;
	
	
	@Autowired
	private UserBO userBO;
	
	
	// 댓글 쓰기
	public void addCommnet(int postId, int userId, String content) {
		
		commentMapper.insertComment(postId, userId, content);
		
	}
	
	
	
	// 게시글 댓글 조회 - TimelineBO 연결
	// input : 글 번호 / output : List<CommentView>
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		
		List<CommentView> commentViewList = new ArrayList<>();
		
		List<Comment> commentList = commentMapper.selectCommnetListByPostId(postId);
				
		// 반복문 순회
		// List<Comment> => List<CommentView>
		for (Comment comment : commentList) {
			
			CommentView commentView = new CommentView();
			
			// 댓글 내용 담기
			commentView.setComment(comment);
			
			// 댓글쓴이 내용 담기
			UserEntity user = userBO.getUserEntityById(comment.getUserId());
			commentView.setUser(user);
			
			// 리스트에 담는다
			commentViewList.add(commentView);
			
		}
		
		return commentViewList;
		
	}
	
	
	
	// 댓글 삭제 (로그인이 되어있을 때)
	// input : 삭제할 댓글 번호 / output : X
	public void deleteCommentById(int id) {
		
		commentMapper.deleteCommentById(id);
	}
	
	

}

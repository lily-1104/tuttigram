package com.tuttigram.post.model;

import java.util.List;

import com.tuttigram.post.comment.model.CommentDetail;
import com.tuttigram.user.model.User;

public class PostDetail {	// User와 Post를 하나로 묶는 클래스
	
	// User 정보
	private User user;
	
	// Post 정보
	private Post post;
	
	// 좋아요 개수 세기 
	private int likeCount;
	
	// 로그인한 사용자의 좋아요 여부
	private boolean isLike;
	
	// 댓글 리스트
	private List<CommentDetail> commentList;

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public List<CommentDetail> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}
	
}

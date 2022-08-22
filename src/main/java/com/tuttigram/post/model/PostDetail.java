package com.tuttigram.post.model;

import com.tuttigram.user.model.User;

public class PostDetail {	// User와 Post를 하나로 묶는 클래스
	
	// User 정보
	private User user;
	
	// Post 정보
	private Post post;
	
	// 좋아요 개수 세기 
	private int likeCount;
	
	
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

}

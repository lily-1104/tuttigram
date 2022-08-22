package com.tuttigram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	
	// 좋아요
	public int addLike(int postId, int userId) {
		
		return likeDAO.insertLike(postId, userId);
	}
	
	
	
	// 좋아요 취소 api
	public int unlike(int postId, int usserId) {
		
		return likeDAO.deleteLike(postId, usserId);
	}
	
	
	
	// postId로 좋아요 개수 조회
	public int countLike(int postId) {
		
		return likeDAO.selectCountLike(postId);
	}
	
	
	
	// 해당하는 postId의 좋아요 모두 삭제
	public int deleteLikeByPostId(int postId) {
		
		return likeDAO.deleteLikeByPostId(postId);
	}
	
	
}

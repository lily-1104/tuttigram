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
	
	
	// 특정 postId에 로그인한 사용자의 userId로 좋아요 했는지 여부
	public boolean isLike(int postId, int userId) {	  // 좋아요 했는지 안했는지라서 boolean 사용
		
		// postId와 userId가 모두 일치하는 행의 개수
		int count = likeDAO.selectCountLikeByPostUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	
	
	// 해당하는 postId의 좋아요 모두 삭제
	public int deleteLikeByPostId(int postId) {
		
		return likeDAO.deleteLikeByPostId(postId);
	}
	
	
}

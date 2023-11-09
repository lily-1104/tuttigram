package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.mapper.LikeMapper;

@Service
public class LikeBO {
	
	
	@Autowired
	private LikeMapper likeMapper;
	
	
	// 좋아요 카운트 - TimelineBO 연결
	// input : 글 번호 / output : 개수 (int)
	public int getLikeCountByPostId(int postId) {
		
		return likeMapper.selectLikeCountByPostId(postId);
	}
	
	
	
	// 내가 좋아요 눌렀는지 여부 - TimelineBO 연결
	// input : 글 번호, userId(Integer) / output : 채워진지 여부 (boolean)
	public boolean filledLike(int postId, Integer userId) {
		
		// 비로그인
		if (userId == null) {
			
			return false;
		}
		
		// 로그인
		// 0보다 큰 경우 있음 (채운다 true), 그렇지 않으면 false (빈하트)
		return likeMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0;
		
	}
	
	
}

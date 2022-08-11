package com.tuttigram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	
	// 글쓰기
	public int addPost(int userId, String content) {
		
		return postDAO.insertPost(userId, content);
	}

}

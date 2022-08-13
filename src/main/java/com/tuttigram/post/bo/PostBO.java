package com.tuttigram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.post.dao.PostDAO;
import com.tuttigram.post.model.Post;
import com.tuttigram.post.model.PostDetail;
import com.tuttigram.user.bo.UserBO;
import com.tuttigram.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	
	// userBO 호출
	@Autowired
	private UserBO userBO;
	
	
	// 글 쓰기
	public int addPost(int userId, String content) {
		
		return postDAO.insertPost(userId, content, ""); 	// imagePath는 ""로!  
	}
	
	
	
	// 게시물 업로드
	public List<PostDetail> getPostList () {
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		List<Post> postList = postDAO.selectPostList();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			
			// user 테이블 조회
			// userBO를 통해서 userId와 일치하는 사용자 정보 조회 (userBO 호출)
			User user = userBO.getUserById(userId);
			
			// 게시글과 사용자 정보를 합치는 과정
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
}

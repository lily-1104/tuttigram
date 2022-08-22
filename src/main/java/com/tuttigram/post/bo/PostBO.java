package com.tuttigram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tuttigram.common.FileManagerService;
import com.tuttigram.post.comment.bo.CommentBO;
import com.tuttigram.post.dao.PostDAO;
import com.tuttigram.post.like.bo.LikeBO;
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
	
	
	@Autowired
	private LikeBO likeBO;
	
	
	@Autowired
	private CommentBO commentBO; 
	
	
	
	// 글 쓰기
	public int addPost(int userId, String content, MultipartFile file) {
		
		// 파일 저장  =>  해당 파일을 외부에서 접근할 수 있는 경로를 만들어서 dao로 전달
		String imagePath = FileManagerService.saveFile(userId, file);
		
		
		// 파일 저장이 실패한 경우
		if(imagePath == null) {
			
			return -1;	// 1이 아닌 결과로 리턴해야함 (PostRestController에서 if(count == 1)이 아니면 "fail"로 리턴하기 때문에
		}
		
		
		return postDAO.insertPost(userId, content, imagePath); 	
								// imagePath 대신 "" 적음 (파일 저장 코딩 안됐을 때 임시로 사용, 나중에는 지금처럼 imagePath로 수정!)  
	
	}
	
	
	
	// 게시물 업로드
	public List<PostDetail> getPostList () {
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		List<Post> postList = postDAO.selectPostList();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			int postId = post.getId();
			
			// user 테이블 조회
			// userBO를 통해서 userId와 일치하는 사용자 정보 조회 (userBO 호출)
			User user = userBO.getUserById(userId);
			int likeCount = likeBO.countLike(postId);
					
			// 게시글과 사용자 정보를 합치는 과정
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setLikeCount(likeCount);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	
	
	// 게시글 삭제
	public int deletePost(int postId, int userId) {
		
		Post post = postDAO.selectPost(postId);
		int count = postDAO.deletePost(postId, userId);
		
		if(count == 1) {
			
		// 파일 삭제  => 파일 경로 알아오기 
//		FileManagerService.removeFile(post.getImagePath());
		
		// 댓글 삭제
		commentBO.deleteComment(postId);
		
		// 좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		
		}
	
		return count;
		
		// 게시글 삭제
//		return postDAO.deletePost(postId, userId);
//		return 1;
		
	} // else {
//		return 0;
//	}
	
}

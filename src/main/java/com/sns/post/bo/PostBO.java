package com.sns.post.bo;

import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.entity.PostEntity;
import com.sns.post.repository.PostRepository;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private FileManagerService fileManager;
	
	
	// 타임라인
	// input : X / output : List<PostEntity>
	public List<PostEntity> getPostList() {
		
		return postRepository.findAllByOrderByIdDesc();
		
	}
	
	
	
	// 게시글 업로드 API
	public PostEntity addPost(int userId, String userLoginId, String content, MultipartFile file) {
		
		String imagePath = null;
		
		// 이미지가 있으면 업로드 후 imagePath를 받아옴
		if (file != null) {
			
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		return postRepository.save(
				PostEntity.builder()
				.userId(userId)
				.content(content)
				.imagePath(imagePath)
				.build());
		
	}
	
	
	
	// 글 삭제 API
	@Transactional		// javax 로 임포트
	public void deletePostById(int postId) {
		
		Cardview post = postRepository.findAllByOrderByIdDesc();
				
		// 기존 글 => 이미지 삭제
		if () {
			
			
		}
		
		
		// db 글 삭제
		
		
		
		// db 댓글 삭제
		
		
		
		// db 좋아요 삭제
		
		
		
		
	}
	
	

}

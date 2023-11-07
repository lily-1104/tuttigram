package com.sns.post.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.post.entity.PostEntity;

@RequestMapping("/post")
@Repository
public interface PostRepository extends JpaRepository<PostEntity, Integer> {
	
	
	// 타임라인
	public List<PostEntity> findAllByOrderByIdDesc();
	
	

}

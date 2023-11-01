package com.sns.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sns.user.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
	
	
	// 로그인 아이디 중복 확인 API
	public UserEntity findByLoginId(String loginId);
	
	
	
	// 로그인 API
	public UserEntity findByLoginIdAndPassword(String loginId, String password);
	

}

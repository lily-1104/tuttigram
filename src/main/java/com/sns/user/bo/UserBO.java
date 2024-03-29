package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.entity.UserEntity;
import com.sns.user.repository.UserRepository;

@Service
public class UserBO {
	
	
	@Autowired
	private UserRepository userRepository;
	
	
	// 타임라인 게시글 카드 (TimelineBO 연결)
	public UserEntity getUserEntityById(int userId) {
		
		return userRepository.findById(userId).orElse(null);
		
	}
	
	
	
	// 로그인 아이디 중복 확인 API
	public UserEntity getUserEntityByLoginId(String loginId) {
		
		return userRepository.findByLoginId(loginId);
		
	}

	
	
	// 회원가입
	// input : 4개 파라미터 / output : id(pk)
	public Integer addUser(String loginId, String password, String name, String email) {
		
		UserEntity userEntity = userRepository.save(
				UserEntity.builder()
				.loginId(loginId)
				.password(password)
				.name(name)
				.email(email)
				.build());
		
		return userEntity == null ? null : userEntity.getId();
		
	}
	
	
	
	// 로그인 API
	public UserEntity getUserEntityByLoginIdPassword(String loginId, String password) {
		
		return userRepository.findByLoginIdAndPassword(loginId, password);
	}
	
	
}

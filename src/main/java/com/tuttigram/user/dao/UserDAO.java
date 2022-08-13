package com.tuttigram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tuttigram.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
		@Param("loginId") String loginId
		, @Param("password") String password
		, @Param("name") String name
		, @Param("email") String email);
	
	
	
	// 전달된 loginId가 몇 개인지 리턴하는 메소드 
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	
	
	// 로그인 API
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	
	
	// id로 사용자 정보 조회 기능 (PostBO 연동)
	public User selectUserById(@Param("id") int id);
	
}

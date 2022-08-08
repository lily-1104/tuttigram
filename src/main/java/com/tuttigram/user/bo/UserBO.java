package com.tuttigram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuttigram.common.EncryptUtils;
import com.tuttigram.user.dao.UserDAO;
import com.tuttigram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	
	// 아이디를 전달 받고 중복 여부를 알려주는 메소드
	public boolean isDuplicate(String loginId) {
		
			// 일치하는 loginId 개수 전달 받고,
			// 0일 경우 불일치
			// 그게 아닐 경우 중복 
		int count = userDAO.selectCountLoginId(loginId);
		
		if (count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	
	// 로그인 API
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	

}

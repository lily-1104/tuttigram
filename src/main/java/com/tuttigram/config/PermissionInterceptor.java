package com.tuttigram.config;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		String url = request.getRequestURI();
		
		// 로그인이 되어 있을 경우
		if(userId != null) {
			
			if(url.startsWith("/user")) {
				response.sendRedirect("/post/timeline/view");
				return false;
			}
			
		} else {	// 로그인이 되어있지 않을 경우
			
			if(url.startsWith("/post")) {
				response.sendRedirect("/user/signin/view");
				return false;
			}
		}
		
		return true;
		
	}
	
	
	
	// 응답 값이 만들어지기 전
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object Handler
			, ModelAndView modelAndView) {
	}
	
	
	
	// 응답 값이 완성된 이후
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object object
			, Exception ex) {
	}
	
	
}

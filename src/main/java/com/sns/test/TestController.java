package com.sns.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.post.mapper.PostMapper;

@Controller
public class TestController {
	
	
	@Autowired
	PostMapper postMapper;
	
	
	// URL : http://localhost:8080/test1
	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		
		return "Hello world";
		
	}
	
	
	
	// URL : http://localhost:8080/test2
	@ResponseBody
	@RequestMapping("/test2")
	public Map<String, Object> test2() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("a", 1);
		map.put("b", 200);
		
		return map;
		
	}
	
	
	
	// URL : http://localhost:8080/test3
	@GetMapping("/test3")
	public String test3() {
		
		return "test/test";
		
	}
	
	
	
	// URL : http://localhost:8080/test4
	@ResponseBody
	@RequestMapping("/test4")
	public List<Map<String, Object>> test4() {
		
		return postMapper.selectPostList();
		
	}
	
	
}

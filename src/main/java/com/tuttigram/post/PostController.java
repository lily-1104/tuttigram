package com.tuttigram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {
	
	@GetMapping("/post/timeline/view")
	public String timelineView() {
		
		return "post/timeline";
	}
	
	
	@GetMapping("/post/timeline/vieww")
	public String timelineVieww() {
		
		return "post/timelinee";
	}
	
	

}

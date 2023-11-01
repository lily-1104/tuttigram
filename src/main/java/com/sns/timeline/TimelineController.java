package com.sns.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sns")
@Controller
public class TimelineController {
	
	
	// 타임라인
	// URL : http://localhost:8080/sns/timeline-view
	@GetMapping("/timeline-view")
	public String timelineView(Model model) {
		
		model.addAttribute("viewName", "timeline/timeline");
		
		return "template/layout";
		
	}
	
	
	

}

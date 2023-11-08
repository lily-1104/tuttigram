package com.sns.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.TimelineBO;
import com.sns.timeline.domain.CardView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
//	@Autowired
//	private PostBO postBO;
	
	@Autowired
	private TimelineBO timelineBO;
	
	
	// 타임라인
	// URL : http://localhost:8080/timeline/timeline-view
	@GetMapping("/timeline-view")
	public String timelineView(Model model, HttpSession session) {
		
		// 내가 좋아요 눌렀는지 여부
		Integer userId = (Integer) session.getAttribute("userId");
		
		List<CardView> careViewList = timelineBO.generateCardViewList(userId);
				
		model.addAttribute("cardList", careViewList);
		
//		List<PostEntity> postList = postBO.getPostList();
		
//		model.addAttribute("postList", postList);
		model.addAttribute("viewName", "timeline/timeline");
		
		return "template/layout";
		
	}
	

}

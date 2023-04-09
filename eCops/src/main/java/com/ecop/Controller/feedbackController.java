package com.ecop.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecop.Entities.*;
import com.ecop.Service.feedbackformService;

@Controller
public class feedbackController {

	@Autowired
	feedbackformService s2 ;
	
	@GetMapping(value = "/feedbackform") 
	public String feedbackform() {
		
		return "feedbackform";
	}
	
	
	
	
	
	@PostMapping("/feedbackform")
	public String feedbackform(@ModelAttribute feedbackform Sk,HttpSession session) 
	{  
		System.out.println(Sk.getFullName());
		s2.feedback(Sk);
		session.setAttribute("msg", "Submitted SuccessFully");
		return "redirect:/feedbackform";
	}
}

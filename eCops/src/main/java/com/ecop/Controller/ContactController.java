package com.ecop.Controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.ecop.Entities.*;

import com.ecop.Service.*;
@Controller
public class ContactController {
	@Autowired
	ContactService s1;
	
@GetMapping("/about")
public String about() {
	return "AboutUs";
}


@GetMapping(value = "/contact") 
public String contact() {
	
	return "ContactUs";
}



@PostMapping("/contact")
public String ContactUs(@ModelAttribute ContactUs Obj,HttpSession session) 
{  
	System.out.println(Obj.getName());
	s1.contact(Obj);
	session.setAttribute("msg", "Form Submitted Successfully");
	return "ContactUs";
}



}

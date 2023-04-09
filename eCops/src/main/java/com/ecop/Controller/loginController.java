package com.ecop.Controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ecop.Entities.User;
import com.ecop.Repository.UserRepository;
import com.ecop.Service.UserService;


@Controller
@SessionAttributes
public class loginController {
	
	@Autowired
	UserService service;
	
	
	@GetMapping(value = "/login")
	public String login()
	{
		return "login";
	}
	
	
	@PostMapping(value="/login")
	public String Login1(String email,String password, HttpSession session) 
	{
		
		
		User u1=service.findbyemailPassword(email,password);
		if(u1 !=null)
		{
			session.setAttribute("User", u1);
		
//			session.setAttribute("email", u1.getEmail());
//			session.setAttribute("name", u1.getName());
			
			return  "redirect:/";
		}
		else {
			session.setAttribute("message", "Invalid credentials");
			return "redirect:/login";
		}
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession  session) 
	{
		session.removeAttribute("User");
		return "redirect:/";
	}
	@GetMapping("/ChangePassword")
	public String ChangePassowrd() {
		return "ChangePassword";
	}

	@PostMapping("/ChangePassword")
	public String ChangePassowrd1(@RequestParam("OldPassword") String OldPassword,@RequestParam("NewPassword") String NewPassword, HttpSession session) {
		try {
			User u=(User) session.getAttribute("User");
			String email1 =u.getEmail();
			User u1 = service.findbyemailPassword(email1, OldPassword);

			if (u1.getPassword().equals(OldPassword)) {
				
				u1.setPassword(NewPassword);
				service.Insert(u1);
				
				session.setAttribute("message", "Password Change sucessfully");
				return "redirect:/logout";
			}
				session.setAttribute("message", "Password update failed");
				return "ChangePassword";
			
		} catch (Exception e) {
			
			session.setAttribute("message", "Password update failed");
			return "ChangePassword";
			
		}
	}
	


}

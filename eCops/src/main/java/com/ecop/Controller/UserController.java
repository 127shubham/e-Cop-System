package com.ecop.Controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecop.Entities.*;
import com.ecop.helper.Message;
import com.ecop.Repository.UserRepository;

@Controller
public class UserController {

	@Autowired
	private UserRepository repo;

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("title", "Home - eCops");
		return "home";

	}

	@GetMapping("/registration")
	public String registration(User user, Model model) {
		model.addAttribute("title", "Home - eCops");
		return "registration";
	}

	// handler for Registration
	@PostMapping("/register")
	public String userRegistration(@Valid User user, BindingResult result, Model model, HttpSession session) {

		System.out.println(user);

		if (result.hasErrors()) {
			System.out.println("Error " + result.toString());
			return "registration";
		}

		System.out.println(user);
		try {

			user = repo.save(user);

			session.setAttribute("message", new Message("User Register Sucessfully, Please login", "alert-success"));
			return "redirect:/login";
		} catch (Exception e) {
			session.setAttribute("message", new Message("Email id is already registred", "alert-success"));
			return "redirect:/registration";
		}
	}
}

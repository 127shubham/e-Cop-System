package com.ecop.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.ecop.Entities.*;
import com.ecop.Service.*;


import java.util.List;

import javax.servlet.http.HttpSession;


@Controller

public class ComplaintController {
	@Autowired

	ComplaintService complaintService;
	
		
	 @GetMapping("/status")
	  public String status()
	  { return "complaintStatusDetails";
	  
	  }

	public ComplaintController(ComplaintService complaintService) {

		this.complaintService = complaintService;
	}

	@GetMapping("/complaints")
	public String listComplaints(Model model,HttpSession session) {
		if(session.getAttribute("User")==null)
		{
			session.setAttribute("message", "please login first");
			return "redirect:/login";
					
		}
		List<Complaint> Complaint = complaintService.getComplaintList();

		model.addAttribute("complaint", Complaint);
		return "complaints";
		
		
	}

	@GetMapping("/addComplaint")
	public String createComplaintForm(Model model) {

		Complaint complaint = new Complaint();
		model.addAttribute("complaint", complaint);
		return "CreateComplaint";

	}

	@PostMapping("/complaints")
	public String saveComplaint(@ModelAttribute("complaint") Complaint complaint) {
//		System.out.println(complaint);
		complaintService.saveComplaint(complaint);
		return "redirect:/complaints";
	}

	@GetMapping("/edit/{id}")
	public String editComplaint(@PathVariable int id, Model m) {
		Complaint c = complaintService.getComplaintById(id);
		m.addAttribute("complaint", c);
		return "edit_complaint";
	}

	// update complaint actual

	@PostMapping("/complaints/{id}")
	public String updateComplaint(@ModelAttribute Complaint c, HttpSession session) {

		complaintService.saveComplaint(c);
		session.setAttribute("message", "complaint is updated sucessfully.....");
		return "redirect:/complaints";

	}

	@GetMapping("/complaints/{id}")
	public String deleteComplaint(@PathVariable int id) {
		complaintService.deleteComplaint(id);

		return "redirect:/complaints";
	}
	@PostMapping("/Update")
	public String UpdateCompalintStatus(String status, int id)
	{
		System.out.println(status);
		System.out.println(id);
		Complaint c = complaintService.getComplaintById(id);
		c.setStatus(status);
		complaintService.saveComplaint(c);
			
		return "redirect:/complaints";
	}
	

}

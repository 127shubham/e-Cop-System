package com.ecop.Controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecop.Entities.Complaint;
import com.ecop.Entities.Permission;
import com.ecop.Service.PermissionService;

@Controller
public class PermissionController 
{
	@Autowired
	private PermissionService service;
	
	@GetMapping("/Permission")
	public String permission(Model m,HttpSession session)
	{
		if(session.getAttribute("User")==null)
		{
			session.setAttribute("message", "please login first");
			return "redirect:/login";
		}		
		
		return "permission";
	}
	
	@PostMapping("/Permission")
	public String PermisionSave(@ModelAttribute Permission P)
	{
		System.out.println(P);
		service.Permission(P);
		return "redirect:/PermissionStatus";
	}
	
	@GetMapping("/Permission/edit/{id}")
	public String editPermission(@PathVariable int id, Model m) {
		Permission c = service.getPermissionById(id);
		m.addAttribute("Permission", c);
		return "edit";
	}
	
	@PostMapping("/Permission/{id}")
	public String updatePermission(@ModelAttribute Permission c) {

		service.savePermission(c);
		return "redirect:/PermissionStatus";

	}
	@GetMapping("/Permission/{id}")
	public String deletePermission(@PathVariable int id) {
		service.deletePermission(id);

		return "redirect:/PermissionStatus";
	}

	@GetMapping("/PermissionStatus")
	public String RequestStatus(Model m,HttpSession session)
	{
		if(session.getAttribute("User")==null)
		{
			session.setAttribute("message", "please login first");
			return "redirect:/login";
					
		}
		List<Permission>permission=service.getAllPermission();
		m.addAttribute("permission",permission);
		System.out.println(permission);
		return "status";
		
	}
	@PostMapping("/UpdateStatus")
	public String PermissionStatus(String status, int id)
	{
		System.out.println(status);
		System.out.println(id);
		Permission P= service.getPermissionById(id);
		P.setStatus(status);
	
		service.savePermission(P);
			
		return "redirect:/PermissionStatus";
	}

}

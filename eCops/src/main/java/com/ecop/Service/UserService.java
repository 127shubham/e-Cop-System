package com.ecop.Service;
import org.springframework.stereotype.*;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.ecop.Entities.User;
import com.ecop.Repository.*;

@Service
public class UserService {
	
	@Autowired
	private UserRepository repo;
	
	public User findbyemailPassword(String email, String password)
	{
		
		 User u1=repo.findByEmailAndPassword(email, password);
		 
		 return u1;
	}
	
	public User Insert(User obj) 
	{
		User obj1= repo.save(obj);
		return obj1;
		
	}
	public Optional<User> UpdateUser(int id)
	{
		Optional<User> obj=repo.findById(id);
		return obj;
	}
	
	

}

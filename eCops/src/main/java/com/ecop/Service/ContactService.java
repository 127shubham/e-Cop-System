package com.ecop.Service;
import com.ecop.Entities.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecop.Repository.*;
@Service
public class ContactService {
	@Autowired
	contactrepository repo;
	 public void contact(ContactUs Obj) {
		repo.save(Obj);
		
	}
	

}

package com.ecop.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecop.Entities.feedbackform;
import com.ecop.Repository.*;


@Service
public class feedbackformService {
	@Autowired
	feedbackformrepository repo;
	 public void feedback(feedbackform Sk) {
		repo.save(Sk);
		
	}
	

}

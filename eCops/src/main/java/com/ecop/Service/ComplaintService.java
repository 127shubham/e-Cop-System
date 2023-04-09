package com.ecop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecop.Entities.Complaint;
import com.ecop.Repository.ComplaintRepository;

import net.bytebuddy.dynamic.DynamicType.Builder.FieldDefinition.Optional;


	
	
	@Service
	public class ComplaintService {
		@Autowired
		ComplaintRepository comp;
		
		public List<Complaint>getComplaintList(){
			
			List<Complaint> Complaint =comp.findAll();
			
			return Complaint;
		}
		
		  
		public void saveComplaint(Complaint complaint) {
			
			comp.save(complaint);
			
		}
		
		
		  public Complaint getComplaintById(int id) { java.util.Optional<Complaint>
		  c=comp.findById(id); if(c.isPresent()) {
		  
		  return c.get(); } return null;
		  
		  }
		  
		  public void deleteComplaint(int id) {
			  
			  comp.deleteById(id);
		  }
		
		 
		 
	
	
	

}

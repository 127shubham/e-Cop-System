package com.ecop.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ecop.Entities.Complaint;

@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Integer> {

	



	/*
	 * void getComplaintById(Integer complaintId); // Complaint void
	 * findComplaintById(Integer id);
	 * 
	 * void updateComplaint(Complaint complaint);
	 * 
	 * void deleteComplaint(Integer complaintId);
	 */
	
	
	 
}
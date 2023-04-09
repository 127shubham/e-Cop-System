package com.ecop.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "Complaints")
public class Complaint {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String subject;
	private String complainttype;
	private String policestation;
	private String description;
	private String location;
	private String uploaddoc;
	
	private String Status="Pending";
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public  Complaint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getComplainttype() {
		return complainttype;
	}
	public void setComplainttype(String complainttype) {
		this.complainttype = complainttype;
	}
	public String getPolicestation() {
		return policestation;
	}
	public void setPolicestation(String policestation) {
		this.policestation = policestation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUploaddoc() {
		return uploaddoc;
	}
	public void setUploaddoc(String uploaddoc) {
		this.uploaddoc = uploaddoc;
	}
	@Override
	public String toString() {
		return "Complaint [id=" + id + ", subject=" + subject + ", complainttype=" + complainttype + ", policestation="
				+ policestation + ", description=" + description + ", location=" + location + ", uploaddoc=" + uploaddoc
				+ ", Status=" + Status + "]";
	}
	

}

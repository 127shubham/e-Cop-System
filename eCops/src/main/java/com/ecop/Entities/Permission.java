package com.ecop.Entities;

import java.sql.Date;
import java.util.Optional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Dell
 *
 */
@Entity
@Table(name= "permission")
public class Permission 
{
	
	public static boolean isPresent;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	 private int id;
	 private String requestfor;
	 private String requesttype;
	 private String requestto;
	 private String location;
	 private String description;
	 private String status="Pending";
	

	 String reqdate = new java.util.Date().toLocaleString();


	 
	 
	 
	 //Getters and setters
	 public static boolean isPresent() {
		return isPresent;
	}
	public static void setPresent(boolean isPresent) {
		Permission.isPresent = isPresent;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRequestfor() {
		return requestfor;
	}
	public void setRequestfor(String requestfor) {
		this.requestfor = requestfor;
	}
	public String getRequesttype() {
		return requesttype;
	}
	public void setRequesttype(String requesttype) {
		this.requesttype = requesttype;
	}
	public String getRequestto() {
		return requestto;
	}
	public void setRequestto(String requestto) {
		this.requestto = requestto;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

	
	
	public String getReqdate() {
		return reqdate;
	}
	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}
	@Override
	public String toString() {
		return "Permission [id=" + id + ", requestfor=" + requestfor + ", requesttype=" + requesttype + ", requestto="
				+ requestto + ", location=" + location + ", description=" + description + ", status=" + status
				+ ", reqdate=" + reqdate + "]";
	}

	public Permission() {
		super();
		// TODO Auto-generated constructor stub
	}
	public static Optional<Permission> get() {
		// TODO Auto-generated method stub
		return null;
	}
	

}

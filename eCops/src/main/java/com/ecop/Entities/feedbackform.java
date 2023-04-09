package com.ecop.Entities;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="feedbackform")
public class feedbackform {
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	
	 private int id;

	 private String fullName;  
	 private String email;
	 private String comments;
	 
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	@Override
	public String toString() {
		return "feedbackform [id=" + id + ", fullName=" + fullName + ",   email=" + email
				+ ", comments=" + comments + "]";
	}
}

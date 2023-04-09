package com.ecop.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Length;


@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@NotBlank(message = "User Name can not be empty..")
	@Size(min = 3, max = 20, message = "User name must be between 3 - 20 characters")
	private String name;

	@Column(unique = true)
	@Email(regexp = "[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", message = "Enter valid email address")
	@NotBlank(message = "Enter your email")
	private String email;

	private String role;
	
	@NotBlank(message = "Phone number is required")
	private String phone;

	@NotBlank(message = " The address field is required ")
	@Column(length = 1000)
	private String address;

	@NotBlank(message = "Enter your password")
	@Length(min = 8, message = "Password must be atleast 8 characters")
	private String password;
	
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	//Getters and Setters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "RegistrationData [name=" + name + ", email=" + email + ", role=" + role + ", phone=" + phone
				+ ", address=" + address + ", password=" + password + "]";
	}

	
}

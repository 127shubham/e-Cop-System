package com.ecop.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ecop.Entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	public User findByEmailAndPassword(String email,String pwd );

}

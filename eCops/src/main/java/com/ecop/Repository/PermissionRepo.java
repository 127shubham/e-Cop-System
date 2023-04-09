package com.ecop.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ecop.Entities.Permission;

@Repository
public interface PermissionRepo extends JpaRepository<Permission, Integer> 
{

}

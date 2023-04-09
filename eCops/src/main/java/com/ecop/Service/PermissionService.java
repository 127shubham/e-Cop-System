package com.ecop.Service;
import java.util.List;
//import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ecop.Entities.Permission;
import com.ecop.Repository.PermissionRepo;

@Service
public class PermissionService 
{
	@Autowired
	private PermissionRepo repo;
	public Object getPermissionById;
	
	public void Permission(Permission P)
	{
		System.out.println(P.getLocation());
		repo.save(P);
	}
	
	  public List<Permission> getAllPermission() 
	  {

		  return repo.findAll();
	  }
	  
	  public Permission getPermissionById(int id) { java.util.Optional<Permission>
	  c=repo.findById(id); if(c.isPresent()) {
	  
	  return c.get(); } return null;
	  
	  }

	  public void savePermission(Permission Permission) {
			
			repo.save(Permission);
			
		}

	  public void deletePermission(int id) {
		  
		  repo.deleteById(id);
	  }
}
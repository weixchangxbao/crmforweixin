package com.brother.basic.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springside.examples.quickstart.entity.Task;

import com.brother.basic.entity.User;



public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<Task>{
	
	public User findByUsername(String username);
	
	
}

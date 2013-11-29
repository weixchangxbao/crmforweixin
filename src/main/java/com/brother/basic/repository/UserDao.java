package com.brother.basic.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.brother.basic.entity.User;



public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User>{
	
	public User findByUsername(String username);
	
}

package com.brother.basic.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.brother.basic.entity.User;



public interface UserDao extends PagingAndSortingRepository<User, Long>{
	
	public User findByUsername(String username);
	
}

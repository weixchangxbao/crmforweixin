package com.brother.basic.repository;

import org.springframework.data.repository.Repository;

import com.brother.basic.entity.User;



public interface UserDao extends Repository<User, Long>{
	
	public User save(User user);
	
	
	public User findUserById(Long Id);
}

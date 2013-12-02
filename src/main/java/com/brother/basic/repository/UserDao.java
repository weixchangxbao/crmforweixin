package com.brother.basic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.User;



public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User>{
	
	public User findByUsername(String username);
	
	@Query("select u from User u where u.username like %:name% or u.rolename like %:name%")
	public Page<User> findBySearch(@Param("name") String name,Pageable pageable);
	
}

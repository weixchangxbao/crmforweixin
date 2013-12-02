package com.brother.basic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.Role;

public interface RoleDao extends PagingAndSortingRepository<Role, Long>, JpaSpecificationExecutor<Role>{

	public Role findByName(String name);
	
	@Query("select r from Role r where r.name like %:name%")
	public Page<Role> findBySearch(@Param("name") String name,Pageable pageable);
}

package com.brother.basic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.ActionLog;

public interface ActionLogDao extends PagingAndSortingRepository<ActionLog,Long>{

	@Query("select a from ActionLog a where a.username like %:name% or a.actionName like %:name%")
	public Page<ActionLog> findBySearch(@Param("name") String name,Pageable pageable);
	
}

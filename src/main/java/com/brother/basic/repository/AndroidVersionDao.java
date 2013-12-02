package com.brother.basic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.AndroidVersion;

public interface AndroidVersionDao extends PagingAndSortingRepository<AndroidVersion,Long>{
	
	@Query("select v from AndroidVersion v where v.version like %:name% or v.createBy like %:name%")
	public Page<AndroidVersion> findBySearch(@Param("name") String name,Pageable pageable);
}

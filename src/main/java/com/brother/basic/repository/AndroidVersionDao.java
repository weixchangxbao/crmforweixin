package com.brother.basic.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.brother.basic.entity.AndroidVersion;

public interface AndroidVersionDao extends PagingAndSortingRepository<AndroidVersion,Long>{
	
	
}

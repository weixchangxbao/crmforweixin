package com.brother.basic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springside.examples.quickstart.entity.Task;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;

public interface ModuleDao extends PagingAndSortingRepository<Module, Long>, JpaSpecificationExecutor<Task>{
	
	@Query("select m from Module m where m.type <> :picture")
	public Page<Module> findAllFuncModule(@Param("picture") ModuleType type,Pageable page);
}

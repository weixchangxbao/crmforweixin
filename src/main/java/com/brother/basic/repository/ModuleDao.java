package com.brother.basic.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;

public interface ModuleDao extends PagingAndSortingRepository<Module, Long>, JpaSpecificationExecutor<Module>{
	
	@Query("select m from Module m where m.type <> :picture")
	public Page<Module> findAllFuncModule(@Param("picture") ModuleType type,Pageable page);
	
	@Query("select m from Module m where m.type = :picture order by m.orderIndex")
	public Page<Module> findAllPictureModule(@Param("picture") ModuleType type,Pageable page);
	
	@Query("select m from Module m where m.type = :top order by m.orderIndex")
	public List<Module> findAllTopModule(@Param("top") ModuleType type);
	
	@Query("select m from Module m where m.type = :buttom order by m.orderIndex")
	public List<Module> findAllButtomModule(@Param("buttom") ModuleType type);
}

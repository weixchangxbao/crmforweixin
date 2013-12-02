package com.brother.basic.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;

public interface ModuleDao extends PagingAndSortingRepository<Module, Long>, JpaSpecificationExecutor<Module>{
	
	@Query("select m from Module m where m.type <> :picture ")
	public Page<Module> findAllFuncModule(@Param("picture") ModuleType type,Pageable page);
	
	@Query("select m from Module m where m.type = :picture ")
	public Page<Module> findAllPictureModule(@Param("picture") ModuleType type,Pageable page);
	
	@Query("select m from Module m where m.type <> :picture and m.id in (:ids) ")
	public Page<Module> findFuncModuleByPerms(@Param("picture") ModuleType type,@Param("ids") List<Long> ids,Pageable page);
	
	@Query("select m from Module m where m.type = :picture and m.id in (:ids) ")
	public Page<Module> findPictureModuleByPerms(@Param("picture") ModuleType type,@Param("ids") List<Long> ids,Pageable page);
	
	@Query("select m from Module m where m.type <> :picture and m.name like %:name%")
	public Page<Module> findAllFuncModuleBySearch(@Param("picture") ModuleType type,@Param("name") String name,Pageable page);
	
	@Query("select m from Module m where m.type = :picture and m.name like %:name%")
	public Page<Module> findAllPictureModuleBySearch(@Param("picture") ModuleType type,@Param("name") String name,Pageable page);
	
	@Query("select m from Module m where m.type <> :picture and m.id in (:ids) and m.name like %:name%")
	public Page<Module> findFuncModuleByPermsAndSearch(@Param("picture") ModuleType type,@Param("name") String name,@Param("ids") List<Long> ids,Pageable page);
	
	@Query("select m from Module m where m.type = :picture and m.id in (:ids) and m.name like %:name%")
	public Page<Module> findPictureModuleByPermsAndSearch(@Param("picture") ModuleType type,@Param("name") String name,@Param("ids") List<Long> ids,Pageable page);
	
	@Query("select m from Module m where m.type = :type order by m.orderIndex")
	public List<Module> findAllByModuleType(@Param("type") ModuleType type);
	
	@Modifying
	@Query("update Module m set m.orderIndex = :orderIndex where m.id = :id")
	public void updateOrderIndex(@Param("id") Long id, @Param("orderIndex") int orderIndex);

	@Query("select m from Module m where m.type=?1 and m.orderIndex = ?2")
	public Module findByTypeAndOrderIndex(ModuleType type,int orderIndex);
}

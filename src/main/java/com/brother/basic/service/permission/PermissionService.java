package com.brother.basic.service.permission;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.brother.basic.entity.Permission;
import com.brother.basic.repository.PermissionDao;

@Component
public class PermissionService {
	@Autowired
	private PermissionDao permissionDao;
	
	public Iterable<Permission> findAll(){
		return permissionDao.findAll();
	}
	
	public List<Permission> findChosedPermissionByRole(Long roleId){
		return permissionDao.findChosedPermissionByRole(roleId);
	}
	
	public List<Permission> findByIdIn(List<Long> ids){
		if(ids != null && ids.size() >0){
			return permissionDao.findByIdIn(ids);
		}else{
			return null;
		}
	}
	
	public Permission getPermissionById(Long id){
		return permissionDao.findOne(id);
	}
}

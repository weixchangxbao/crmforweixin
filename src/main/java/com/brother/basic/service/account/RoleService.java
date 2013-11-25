package com.brother.basic.service.account;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.brother.basic.entity.Role;
import com.brother.basic.repository.RoleDao;
import com.brother.basic.search.SearchBean;

@Component
@Transactional
public class RoleService {

	private static Logger logger = LoggerFactory.getLogger(RoleService.class);
	
	@Autowired
	private RoleDao roleDao;

	public Page<Role> getRolesByPageInfo(SearchBean search){
		Pageable pageable = new PageRequest(search.getiDisplayStart(), search.getiDisplayLength());
		return roleDao.findAll(pageable);
	}
	
	public Role create(Role role){
		return roleDao.save(role);
	}
	
	public List<Role> getAllRoles(){
		return (List<Role>)roleDao.findAll();
	}
	
	public Role getRoleById(Long id){
		return roleDao.findOne(id);
	}
}

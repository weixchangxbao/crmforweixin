package com.brother.basic.service.module;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.repository.ModuleDao;
import com.brother.basic.search.SearchBean;

@Component
public class ModuleService {

	@Autowired
	private ModuleDao moduleDao;
	
	public void create(Module module){
		moduleDao.save(module);
	}
	
	public Page<Module> listAllFuncModule(SearchBean search){
		Pageable pageable = new PageRequest(search.getiDisplayStart(), search.getiDisplayLength());
		return moduleDao.findAllFuncModule(ModuleType.PICTURE, pageable);
	}
	
}

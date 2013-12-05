package com.brother.basic.service.module;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.repository.ModuleDao;
import com.brother.basic.search.SearchBean;

@Component
public class ModuleService {

	@Autowired
	private ModuleDao moduleDao;
	
	public void saveOrUpdate(Module module){
		moduleDao.save(module);
	}
	
	public void delete(Long id){
		moduleDao.delete(id);
	}
	
	public Module getModuleById(Long id){
		return moduleDao.findOne(id);
	}
	
	public Iterable<Module> findAll(){
		return moduleDao.findAll();
	}
	
	@Transactional
	public void updateOrderIndex(Long id,int orderIndex){
		moduleDao.updateOrderIndex(id, orderIndex);
	}
	
	public Page<Module> listAllFuncModule(SearchBean search){
		Pageable pageable = new PageRequest(search.getPage(), search.getiDisplayLength(),Direction.ASC,"type","orderIndex");
		if(search.getsSearch()!=null && !search.getsSearch().equals("")){
			return moduleDao.findAllFuncModuleBySearch(ModuleType.PICTURE,search.getsSearch(),pageable);
		}
		return moduleDao.findAllFuncModule(ModuleType.PICTURE, pageable);
	}
	
	public Page<Module> listAllPictureModule(SearchBean search){
		Pageable pageable = new PageRequest(search.getPage(), search.getiDisplayLength(),Direction.ASC,"type","orderIndex");
		if(search.getsSearch()!=null && !search.getsSearch().equals("")){
			return moduleDao.findAllPictureModuleBySearch(ModuleType.PICTURE,search.getsSearch(),pageable);
		}
		return moduleDao.findAllPictureModule(ModuleType.PICTURE, pageable);
	}
	
	public Page<Module> listFuncModuleByPerms(SearchBean search,List<Long> ids){
		Pageable pageable = new PageRequest(search.getPage(), search.getiDisplayLength(),Direction.ASC,"type","orderIndex");
		if(search.getsSearch()!=null && !search.getsSearch().equals("")){
			return moduleDao.findFuncModuleByPermsAndSearch(ModuleType.PICTURE,search.getsSearch(), ids,pageable);
		}
		return moduleDao.findFuncModuleByPerms(ModuleType.PICTURE,ids, pageable);
	}
	
	public Page<Module> listPictureModuleByPerms(SearchBean search,List<Long> ids){
		Pageable pageable = new PageRequest(search.getPage(), search.getiDisplayLength(),Direction.ASC,"type","orderIndex");
		if(search.getsSearch()!=null && !search.getsSearch().equals("")){
			return moduleDao.findPictureModuleByPermsAndSearch(ModuleType.PICTURE,search.getsSearch(), ids,pageable);
		}
		return moduleDao.findPictureModuleByPerms(ModuleType.PICTURE, ids,pageable);
	}
	
	public List<Module> listAllPictureModule(){
		return moduleDao.findAllByModuleType(ModuleType.PICTURE);
	}
	
	public List<Module> listAllTopModule(){
		return moduleDao.findAllByModuleType(ModuleType.TOP);
	}
	
	public List<Module> listAllButtomModule(){
		return moduleDao.findAllByModuleType(ModuleType.BUTTOM);
	}
	
	public Module findByTypeAndOrederIndex(ModuleType type,int orderIndex){
		return moduleDao.findByTypeAndOrderIndex(type, orderIndex);
	}

	public int findTopModuleCount() {
		return moduleDao.findTopModuleCount();
	}
}

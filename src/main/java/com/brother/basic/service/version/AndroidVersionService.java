package com.brother.basic.service.version;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import com.brother.basic.entity.AndroidVersion;
import com.brother.basic.repository.AndroidVersionDao;
import com.brother.basic.search.SearchBean;

@Component
public class AndroidVersionService {

	@Autowired
	private AndroidVersionDao androidVersionDao;
	
	public Page<AndroidVersion> getVersionsByPageInfo(SearchBean search) {
		Pageable pageable = new PageRequest(search.getiDisplayStart(), search.getiDisplayLength());
		return androidVersionDao.findAll(pageable);
	}
	
	public AndroidVersion update(AndroidVersion version){
		version.setCreateBy((String)SecurityUtils.getSubject().getPrincipal());
		version.setCreateTime(new Date());
		return androidVersionDao.save(version);
	}

}

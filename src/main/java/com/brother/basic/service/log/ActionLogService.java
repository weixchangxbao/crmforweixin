package com.brother.basic.service.log;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import com.brother.basic.entity.ActionLog;
import com.brother.basic.repository.ActionLogDao;
import com.brother.basic.search.SearchBean;
import com.brother.basic.service.account.ShiroDbRealm.ShiroUser;


@Component
public class ActionLogService {
	@Autowired
	private ActionLogDao actionLogDao;
	
	public void addLog(String actionName,String  detail,String ip){
		ActionLog log = new ActionLog();
		if(SecurityUtils.getSubject().getPrincipal()!=null){
			ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
			log.setUsername(user.getUserName());
		}
		log.setActionTime(new Date());
		log.setActionName(actionName);
		log.setDetail(detail);
		log.setIp(ip);
		actionLogDao.save(log);
	}
	
	public Page<ActionLog> findActionByPage(SearchBean search){
		Pageable pageable = new PageRequest(search.getPage(), search.getiDisplayLength());
		if(search.getsSearch()!=null && !search.getsSearch().equals("")){
			actionLogDao.findBySearch( search.getsSearch(),pageable);
		}
		return actionLogDao.findAll(pageable);
	}
}

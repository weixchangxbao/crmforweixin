package com.brother.basic.web.account;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brother.basic.entity.Role;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.account.RoleService;

@Controller
@RequestMapping(value="/admin/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String show(){
		return "/account/adminRoleList";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody SearchResult list(SearchBean search){
		Page<Role> pageUser = roleService.getRolesByPageInfo(search);
		SearchResult result = new SearchResult();
		result.setAaData(pageUser.getContent());
		long total = pageUser.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	@RequestMapping(value="/create")
	public String createOrUpdate(Role role){
		role.setCreateBy(SecurityUtils.getSubject().getPrincipals().toString());
		role.setCreateTime(new Date());
		roleService.create(role);
		return "redirect:/admin/role";
	}
}

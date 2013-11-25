package com.brother.basic.web.account;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brother.basic.entity.Role;
import com.brother.basic.entity.User;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.account.AccountService;
import com.brother.basic.service.account.RoleService;

@Controller
@RequestMapping(value="/admin/user")
public class UserAdminController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String show(){
		return "/account/adminUserList";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody SearchResult list(SearchBean search){
		Page<User> pageUser = accountService.getUsersByPageInfo(search);
		SearchResult result = new SearchResult();
		result.setAaData(pageUser.getContent());
		long total = pageUser.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	@RequestMapping(value="/add")
	public String update(Model model){
		List<Role> roles = roleService.getAllRoles();
		model.addAttribute("rolesSel", roles);
		return "account/adminUserForm";
	}
	
	@RequestMapping(value="/create")
	public String create(User user,@RequestParam String roleids){
		String rolenames = "";
		if(roleids != null && !roleids.trim().equals("")){
			String[]ids = roleids.split(",");
			List<Role> roles = new ArrayList<Role>();
			for(int i=0;i<ids.length;i++){
				Role role  = roleService.getRoleById(Long.parseLong(ids[i]));
				roles.add(role);
				if(i==0){
					rolenames = role.getName();
				}else{
					rolenames = rolenames + "," +role.getName();
				}
			}
			user.setRoles(roles);
			user.setRolename(rolenames);
		}
		accountService.updateUser(user);
		return "/account/adminUserList";
	}
	
	@RequestMapping(value="view/{id}")
	public String view(@PathVariable("id") Long id,Model model){
		model.addAttribute("user",accountService.getUser(id));
		model.addAttribute("model","view");
		return "/account/adminUserEditForm";
	}
	
	@RequestMapping(value="delete/{id}")
	public String delete(@PathVariable("id") Long id,Model model){
		accountService.deleteUser(id);
		return "redirect:/admin/user";
	}
	
	@RequestMapping(value="edit/{id}")
	public String edit(@PathVariable("id") Long id,Model model){
		List<Role> roles = roleService.getAllRoles();
		model.addAttribute("rolesSel", roles);
		model.addAttribute("user",accountService.getUser(id));
		return "/account/adminUserEditForm";
	}
}

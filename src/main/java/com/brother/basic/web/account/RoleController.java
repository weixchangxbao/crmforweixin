package com.brother.basic.web.account;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.entity.Permission;
import com.brother.basic.entity.Role;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.account.RoleService;
import com.brother.basic.service.log.ActionLogService;
import com.brother.basic.service.module.ModuleService;
import com.brother.basic.service.permission.PermissionService;

@Controller
@RequestMapping(value="/admin/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private ActionLogService actionLogService;
	
	@Autowired
	private ModuleService moduleService;
	
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
	public String create(Role role,HttpServletRequest request){
		role.setCreateBy(SecurityUtils.getSubject().getPrincipals().toString());
		role.setCreateTime(new Date());
		roleService.saveOrUpdate(role);
		actionLogService.addLog("新增角色", role.toString(), request.getRemoteAddr());
		return "redirect:/admin/role";
	}
	
	@RequestMapping(value="/update")
	public String update(@RequestParam("name") String name,@RequestParam("id") Long id,HttpServletRequest request){
		Role role = roleService.getRoleById(id);
		role.setName(name);
		roleService.saveOrUpdate(role);
		actionLogService.addLog("更新角色", role.toString(), request.getRemoteAddr());
		return "redirect:/admin/role";
	}
	
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Long id,HttpServletRequest request){
		Role role = roleService.getRoleById(id);
		actionLogService.addLog("删除角色", role.toString(), request.getRemoteAddr());
		roleService.deleteById(id);
		return "redirect:/admin/role";
	}
	
	@RequestMapping(value="modulePermission/{id}")
	public String editModulePermission(@PathVariable("id") Long id , Model model){
		Role role = roleService.getRoleById(id);
		List<Module> roleModules = (List<Module>)role.getModules();
		Iterable<Module> allmodules = moduleService.findAll();
		List<Module> unChosedModules = getUnChosedModules(allmodules,roleModules);
		Map<ModuleType,List<Module>> moduleMap = new HashMap<ModuleType, List<Module>>();
		createModuleMap(moduleMap,roleModules,true);
		createModuleMap(moduleMap,unChosedModules,false);
		model.addAttribute("role", role);
		model.addAttribute("moduleMap", moduleMap);
		return "/permission/editModulePermission";
	}

	@RequestMapping(value="updateModulePermission")
	public String updateModulePermission(@RequestParam("ids") String ids,@RequestParam("roleId") Long roleId,HttpServletRequest request){
		Role role = roleService.getRoleById(roleId);
		if(ids == null || ids.equals("")){
			return "redirect:/admin/role";
		}
		String[] strIds = ids.split(",");
		List<Module> roleModules = new ArrayList<Module>();
		for(String id: strIds){
			Module module = moduleService.getModuleById(Long.parseLong(id));
			roleModules.add(module);
		}
		actionLogService.addLog("更新模块权限", role.toString()+"，permission:"+ids, request.getRemoteAddr());
		role.setModules(roleModules);
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role";
	}
	
	private void createModuleMap(Map<ModuleType,List<Module>> moduleMap, List<Module> modules,boolean ischosed){
		for(Module module:modules){
			module.setChosed(ischosed);
			if(moduleMap.containsKey(module.getType())){
				moduleMap.get(module.getType()).add(module);
			}else{
				List<Module> subModules = new ArrayList<Module>();
				subModules.add(module);
				moduleMap.put(module.getType(), subModules);
			}
		}
	}
	
	
	@RequestMapping(value="permission/{id}")
	public String editPermission(@PathVariable("id") Long id, Model model){
		Role role = roleService.getRoleById(id);
		//获取角色已有权限
		List<Permission> rolePermissions = permissionService.findChosedPermissionByRole(role.getId());
		//获取所有数据库中的权限
		Iterable<Permission> allPermissions = permissionService.findAll();
		List<Permission> unChosePermissions = getUnChosedPermission(allPermissions,rolePermissions);
		Map<String,Map<String,List<Permission>>> permissionTree = new HashMap<String, Map<String,List<Permission>>>();
		createPermissionTree(rolePermissions, permissionTree,true);
		createPermissionTree(unChosePermissions, permissionTree,false);
		model.addAttribute("permissionTree",permissionTree);
		model.addAttribute("role", role);
		return "/permission/editPermission";
	}

	@RequestMapping(value="updatePermission")
	public String updatePermission(@RequestParam("chosedPermission") String chosedPermission,@RequestParam("roleId") Long roleId,HttpServletRequest request){
		if(chosedPermission!=null && !chosedPermission.equals("")){
			String[] strPermissionIds = chosedPermission.split(",");
			List<Long> ids = new ArrayList<Long>();
			for(String permissionId : strPermissionIds){
				ids.add(Long.parseLong(permissionId));
			}
			List<Permission> permissions = permissionService.findByIdIn(ids);
			Role role  = roleService.getRoleById(roleId);
			if(role != null){
				role.setPermissions(permissions);
				actionLogService.addLog("更新权限", role.toString()+",permission:"+ids, request.getRemoteAddr());
				roleService.saveOrUpdate(role);
			}
		}
		return "redirect:/admin/role";
	}
	
	private List<Permission> getUnChosedPermission(Iterable<Permission> allPermission,List<Permission> chosedPermission){
		Iterator<Permission> iterator = allPermission.iterator();
		List<Permission> unchosedPermissions = new ArrayList<Permission>();
		while(iterator.hasNext()){
			Permission permission = iterator.next();
			if(!chosedPermission.contains(permission)){
				unchosedPermissions.add(permission);
			}
		}
		return unchosedPermissions;
	}
	
	private List<Module> getUnChosedModules(Iterable<Module> allModules,List<Module> chosedModules){
		Iterator<Module> iterator = allModules.iterator();
		List<Module> unchosedModules = new ArrayList<Module>();
		while(iterator.hasNext()){
			Module module = iterator.next();
			if(!chosedModules.contains(module)){
				unchosedModules.add(module);
			}
		}
		return unchosedModules;
	}
	
	private void createPermissionTree(List<Permission> rolePermissions,
			Map<String, Map<String, List<Permission>>> permissionTree,boolean chosed) {
		for(Permission permission:rolePermissions){
			permission.setChosed(chosed);
			if(permissionTree.get(permission.getGroupName())==null){
				List<Permission> pers = new ArrayList<Permission>();
				pers.add(permission);
				Map<String,List<Permission>> permap = new HashMap<String,List<Permission>>();
				permap.put(permission.getModule(), pers);
				permissionTree.put(permission.getGroupName(), permap);
			}else{
				Map<String,List<Permission>> permap = permissionTree.get(permission.getGroupName());
				if(permap.get(permission.getModule()) == null){
					List<Permission> pers = new ArrayList<Permission>();
					pers.add(permission);
					permap.put(permission.getModule(), pers);
				}else{
					permap.get(permission.getModule()).add(permission);
				}
			}
		}
	}
	
	@RequestMapping(value="checkName")
	public void checkName(@RequestParam(value="id",required=false) String id,@RequestParam("name") String name,HttpServletResponse response){
		Role role = roleService.getRoleByName(name);
		String result = null;
		if(role == null){
			result = "true";
		}else if (id != null && role.getId() == Long.parseLong(id)) {
			result = "true";
		}else{
			result = "false";
		}
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}


package com.brother.basic.web.account;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.account.ShiroDbRealm.ShiroUser;
import com.brother.basic.service.log.ActionLogService;
import com.brother.basic.service.module.ModuleService;

@Controller
@RequestMapping(value="/admin/module")
public class ModuleController {
	
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private ActionLogService actionLogService;

	@RequestMapping(value="/location")
	public String showLocation(Model model){
		model.addAttribute("buttom",moduleService.listAllButtomModule());
		model.addAttribute("top", moduleService.listAllTopModule());
		return "/module/adminModuleLocation";
	}
	
	@RequestMapping(value="/pictform")
	public String showPictForm(){
		return "/module/adminPictureModuleForm";
	}
	
	@RequestMapping(value="/funcform")
	public String showFuncForm(){
		return "/module/adminFuncModuleForm";
	}
	
	@RequestMapping(value="func")
	public String showFuncList(){
		return "/module/adminFuncModuleList";
	}
	
	@RequestMapping(value="picture")
	public String showPictureList(){
		return "/module/adminPictureModuleList";
	}
	
	@RequestMapping(value="/pictupload")
	public void pictupload(@RequestParam MultipartFile picture ,HttpServletRequest request,HttpServletResponse response){
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		String filename = picture.getOriginalFilename();
		try {
			FileUtils.copyInputStreamToFile(picture.getInputStream(), new File(realPath,filename));
			response.getWriter().write("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="delete/{id}")
	public String delete(@PathVariable("id") Long id,HttpServletRequest request){
		actionLogService.addLog("删除图片", "pictureid:"+id, request.getRemoteAddr());
		moduleService.delete(id);
		return "redirect:/admin/module/picture";
	}
	
	@RequestMapping(value="deleteFunc/{id}")
	public String deleteFunc(@PathVariable("id") Long id,HttpServletRequest request){
		actionLogService.addLog("删除模块", "moduleID:"+id, request.getRemoteAddr());
		moduleService.delete(id);
		return "redirect:/admin/module/func";
	}

	
	@RequestMapping(value="editPicture/{id}")
	public String editPicture(@PathVariable("id") Long id ,RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("module",moduleService.getModuleById(id));
		return "redirect:/admin/module/pictform";
	}
	
	@RequestMapping(value="editFunc/{id}")
	public String editFunc(@PathVariable("id") Long id ,RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("module",moduleService.getModuleById(id));
		return "redirect:/admin/module/funcform";
	}
	
	@RequestMapping(value="updateLocation")
	public String updateLocation(@RequestParam("locations") String locations){
		if(locations != null && !locations.equals("")){
			String[] tls = locations.split(",");
			for(String tl : tls){
				String[] indexs = tl.split(":");
				moduleService.updateOrderIndex(Long.parseLong(indexs[0]), Integer.parseInt(indexs[1]));
			}
		}
		return "redirect:/admin/module/func";
	}
	
	
	@RequestMapping(value="createFunc")
	public String createFunc(Module module,@RequestParam("moduleType") int moduleType,HttpServletRequest request){
		for(ModuleType type: ModuleType.values()){
			if(type.ordinal()==moduleType){
				module.setType(type);
			}
		}
		if(module.getId() == null){
			module.setCreateBy(SecurityUtils.getSubject().getPrincipal().toString());
			module.setCreateTime(new Date());	
		}else{
			Module om = moduleService.getModuleById(module.getId());
			module.setCreateBy(om.getCreateBy());
			module.setCreateTime(om.getCreateTime());
		}
		actionLogService.addLog("创建模块", module.toString(), request.getRemoteAddr());
		moduleService.saveOrUpdate(module);
		return "redirect:/admin/module/func";
	}
	
	
	@RequestMapping(value="/create")
	public String create(Module module,HttpServletRequest request){
		module.setType(ModuleType.PICTURE);
		if(module.getId() == null){
			module.setCreateBy(SecurityUtils.getSubject().getPrincipal().toString());
			module.setCreateTime(new Date());	
		}else{
			Module om = moduleService.getModuleById(module.getId());
			module.setCreateBy(om.getCreateBy());
			module.setCreateTime(om.getCreateTime());
		}
		actionLogService.addLog("创建图片", module.toString(), request.getRemoteAddr());
		moduleService.saveOrUpdate(module);
		return "redirect:/admin/module/picture";
	}
	
	@RequestMapping(value="listFuncModule")
	public @ResponseBody SearchResult list(SearchBean search){
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		if(user == null){
			throw new AuthorizationException();
		}
		Page<Module> pageModule = null;
		if(SecurityUtils.getSubject().hasRole("admin")){
			pageModule = moduleService.listAllFuncModule(search);
		}else{
			List<Long> ids = user.getFunctionModule();
			if(ids ==  null || ids.size()==0){
				SearchResult result = new SearchResult();
				result.setAaData(new ArrayList());
				result.setiTotalRecords(0);
				result.setsEcho(search.getsEcho());
				return result;
			}else{
				pageModule = moduleService.listFuncModuleByPerms(search, ids);
			}
		}
		SearchResult result = new SearchResult();
		result.setAaData(pageModule.getContent());
		long total = pageModule.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	
	@RequestMapping(value="listPictureModule")
	public @ResponseBody SearchResult listPicture(SearchBean search){
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		if(user == null){
			throw new AuthorizationException();
		}
		Page<Module> pageModule = null;
		if(SecurityUtils.getSubject().hasRole("admin")){
			pageModule = moduleService.listAllPictureModule(search);
		}else{
			List<Long> ids = user.getPictureModule();
			if(ids ==  null || ids.size()==0){
				SearchResult result = new SearchResult();
				result.setAaData(new ArrayList());
				result.setiTotalRecords(0);
				result.setsEcho(search.getsEcho());
				return result;
			}else{
				pageModule = moduleService.listPictureModuleByPerms(search, ids);
			}
		}
		SearchResult result = new SearchResult();
		result.setAaData(pageModule.getContent());
		long total = pageModule.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	@RequestMapping(value="checkFunLocation")
	public void checkLocation(@RequestParam(value="id",required=false) String id,
			@RequestParam("type") int type,@RequestParam("orderIndex") int orderIndex,HttpServletResponse response){
		ModuleType moduleType = null;
		for(ModuleType mt: ModuleType.values()){
			if(mt.ordinal()==type){
				moduleType = mt;
			}
		}
		String result = null;
		Module module = moduleService.findByTypeAndOrederIndex(moduleType, orderIndex);
		if(module == null){
			result = "true";
		}else if(id != null && module.getId() == Long.parseLong(id)){
			result = "true";
		}else{
			result = "false";
		}
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/updatePictureLocation")
	public String updatePictureLocation(@RequestParam("original") Long original,@RequestParam("changeto") Long changeto){
		Module mo = moduleService.getModuleById(original);
		Module mc = moduleService.getModuleById(changeto);
		int index = mo.getOrderIndex();
		mo.setOrderIndex(mc.getOrderIndex());
		mc.setOrderIndex(index);
		moduleService.saveOrUpdate(mo);
		moduleService.saveOrUpdate(mc);
		return "redirect:/admin/module/picture";
	}
}

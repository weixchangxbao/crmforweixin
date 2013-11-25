package com.brother.basic.web.account;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.brother.basic.entity.Module;
import com.brother.basic.entity.ModuleType;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.module.ModuleService;

@Controller
@RequestMapping(value="/admin/module")
public class ModuleController {
	
	@Autowired
	private ModuleService moduleService;

	@RequestMapping(value="/location")
	public String showLocation(){
		return "/module/adminModuleLocation";
	}
	
	@RequestMapping(value="/pictform")
	public String showPictForm(){
		return "/module/adminPictrueModuleForm";
	}
	
	@RequestMapping(value="/funcform")
	public String showFuncForm(){
		return "/module/adminFuncModuleForm";
	}
	
	@RequestMapping(value="func")
	public String showFuncList(){
		return "/module/adminFuncModuleList";
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
	
	@RequestMapping(value="createFunc")
	public String createFunc(Module module,@RequestParam("moduleType") int moduleType){
		module.setCreateBy(SecurityUtils.getSubject().getPrincipal().toString());
		module.setCreateTime(new Date());
		for(ModuleType type: ModuleType.values()){
			if(type.ordinal()==moduleType){
				module.setType(type);
			}
		}
		moduleService.create(module);
		return "redirect:/admin/module/func";
	}
	
	
	@RequestMapping(value="/create")
	public String create(Module module){
		module.setType(ModuleType.PICTURE);
		module.setCreateBy(SecurityUtils.getSubject().getPrincipal().toString());
		module.setCreateTime(new Date());
		moduleService.create(module);
		return "redirect:/admin/module/pictform";
	}
	
	@RequestMapping(value="listFuncModule")
	public @ResponseBody SearchResult list(SearchBean search){
		Page<Module> pageUser = moduleService.listAllFuncModule(search);
		SearchResult result = new SearchResult();
		result.setAaData(pageUser.getContent());
		long total = pageUser.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
}

package com.brother.basic.web.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brother.basic.entity.Module;
import com.brother.basic.service.module.ModuleService;

@Controller
public class MainPageController {
	
	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping("/app/index.html")
	public String getMainPage(Model model){
		List<Module> buttoms = moduleService.listAllButtomModule();
		List<Module> tops = moduleService.listAllTopModule();
		List<Module> pictures = moduleService.listAllPictureModule();
		model.addAttribute("tops",tops);
		model.addAttribute("buttoms", buttoms);
		model.addAttribute("pictures", pictures);
		return "/mainpage/index";
	}
}

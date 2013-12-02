package com.brother.basic.web.account;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.brother.basic.service.account.ShiroDbRealm.ShiroUser;


@Controller
@RequestMapping(value="/login")
public class LoginController {

	@RequestMapping(method = RequestMethod.GET)
	public String login(){
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		if(user == null){
			return "/account/login";
		}else{
			return "/mainpage/welcome";
		}
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
			model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
			return "/account/login";
	}
	
	@RequestMapping(value="/welcome")
	public String welcome(){
		return "mainpage/welcome";
	}
}

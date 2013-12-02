package com.brother.basic.web.account;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.brother.basic.entity.User;
import com.brother.basic.service.account.AccountService;

@Controller
@RequestMapping(value="/admin/profile")
public class ProfileController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String showProfile(Model model){
		if(SecurityUtils.getSubject() ==null){
			throw new AuthorizationException();
		}
		User user = accountService.findUserByUsername(SecurityUtils.getSubject().getPrincipal().toString());
		model.addAttribute("user", user);
		return "/account/profile";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String profile(@RequestParam("id") Long id,@RequestParam("plainPassword") String planPassword){
		User user = accountService.getUser(id);
		user.setPlainPassword(planPassword);
		accountService.updatePassword(user);
		return "/mainpage/welcome";
	}

	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
}

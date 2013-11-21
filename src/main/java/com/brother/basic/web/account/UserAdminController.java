package com.brother.basic.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/admin/user")
public class UserAdminController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String show(){
		return "/account/adminUserList";
	}
	
	@ResponseBody
	public String list(Search){
		
	}
}

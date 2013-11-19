package com.brother.basic.service.account;

import org.apache.shiro.authc.UsernamePasswordToken;

public class KaptchaUsernamePasswordToken extends UsernamePasswordToken{

	private static final long serialVersionUID = 1L;

	private String kaptcha;
	
	
	public String getKaptcha() {
		return kaptcha;
	}

	public void setKaptcha(String kaptcha) {
		this.kaptcha = kaptcha;
	}

	public KaptchaUsernamePasswordToken(String username,char[] password, 
			 boolean rememberMe, String host,String kaptcha){
		super(username,password,rememberMe,host);
		this.kaptcha = kaptcha;
	}
	
}

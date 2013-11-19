package com.brother.basic.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.brother.basic.exception.IncorrectKaptchaException;
import com.brother.basic.service.account.KaptchaUsernamePasswordToken;
/**
 * 扩展Shiro原有FormAuthenticationFilter,添加验证框验证
 * @author tiger
 *
 */
public class KaptchaFormAuthenticationFilter extends FormAuthenticationFilter{

	public static final String DEFAULT_KAPTCHA_PARAM = "kaptcha";
	
	private String kaptchaParam = DEFAULT_KAPTCHA_PARAM;

	public String getKaptchaParam() {
		return kaptchaParam;
	}

	public void setKaptchaParam(String kaptchaParam) {
		this.kaptchaParam = kaptchaParam;
	}
	
	protected String getKaptcha(ServletRequest request){
		return WebUtils.getCleanParam(request, getKaptchaParam());
	}
	
	protected KaptchaUsernamePasswordToken createToken(ServletRequest request ,ServletResponse reponse){
		String username = getUsername(request);
		String password = getPassword(request);
		String host = getHost(request);
		boolean rememberMe = isRememberMe(request);
		String kaptcha = getKaptcha(request);
		
		return new KaptchaUsernamePasswordToken(username,password.toCharArray(),rememberMe,host,kaptcha);
	}
	
	protected void doKaptchaValidate(HttpServletRequest request,KaptchaUsernamePasswordToken token){
		String kaptcha = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		
		if(kaptcha != null && !kaptcha.equalsIgnoreCase(token.getKaptcha())){
			throw new IncorrectKaptchaException("验证失败！");
		}
	}

	protected boolean executeLogin(ServletRequest request, ServletResponse response)
			throws Exception {
		KaptchaUsernamePasswordToken token = createToken(request,response);
		try{
			doKaptchaValidate((HttpServletRequest)request,token);
			
			Subject subject = getSubject(request, response);
			subject.login(token);
			
			return onLoginSuccess(token, subject, request, response);
		}catch(AuthenticationException e){
			return onLoginFailure(token, e, request, response);
		}
		
	}
	
	
}

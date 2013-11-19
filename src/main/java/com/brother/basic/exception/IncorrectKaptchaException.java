package com.brother.basic.exception;

import org.apache.shiro.authc.AuthenticationException;

public class IncorrectKaptchaException extends AuthenticationException{

	public IncorrectKaptchaException() {
		super();
	}

	public IncorrectKaptchaException(String message, Throwable cause) {
		super(message, cause);
	}

	public IncorrectKaptchaException(String message) {
		super(message);
	}

	public IncorrectKaptchaException(Throwable cause) {
		super(cause);
	}

	private static final long serialVersionUID = 1L;

}

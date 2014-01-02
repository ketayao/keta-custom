/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.controller.LoginController.java
 * Class:			LoginController
 * Date:			2012-8-2
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/

package com.ketayao.ketacustom.controller;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.shiro.IncorrectCaptchaException;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.utils.Exceptions;

/**
 * 
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> Version 1.1.0
 * @since 2012-8-2 下午5:29:01
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class); 
	
	private static final String LOGIN_PAGE = "login";
	private static final String LOGIN_DIALOG = "management/index/loginDialog";

	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		return LOGIN_PAGE;
	}
	
	@RequestMapping(method = {RequestMethod.GET}, params="ajax=true")
	public @ResponseBody String loginDialog2AJAX() {
		return loginDialog();
	}
		
	@RequestMapping(method = {RequestMethod.GET}, headers = "X-Requested-With=XMLHttpRequest")
	public @ResponseBody String loginDialog() {
		return AjaxObject.newTimeout("会话超时，请重新登录。").toString();
	}

	@RequestMapping(value = "/timeout", method = { RequestMethod.GET })
	public String timeout() {
		return LOGIN_DIALOG;
	}

	@Log(message="会话超时， 该用户重新登录系统。")
	@RequestMapping(value = "/timeout/success", method = {RequestMethod.GET})
	public @ResponseBody String timeoutSuccess() {
		return AjaxObject.newOk("登录成功。").toString();
	}

	@RequestMapping(method = RequestMethod.POST)
	public String fail(
			@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String username,
			Map<String, Object> map, ServletRequest request) {

		String msg = parseException(request);
		
		map.put("msg", msg);
		map.put("username", username);
		
		return LOGIN_PAGE;
	}

	@RequestMapping(method = {RequestMethod.POST}, headers = "x-requested-with=XMLHttpRequest")
	public @ResponseBody String failDialog(ServletRequest request) {
		String msg = parseException(request);
		
		AjaxObject ajaxObject = new AjaxObject(msg);
		ajaxObject.setStatusCode(AjaxObject.STATUS_CODE_FAILURE);
		ajaxObject.setCallbackType("");

		return ajaxObject.toString();
	}

	private String parseException(ServletRequest request) {
		String errorString = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		Class<?> error = null;
		try {
			if (errorString != null) {
				error = Class.forName(errorString);
			}
		} catch (ClassNotFoundException e) {
			LOG.error(Exceptions.getStackTraceAsString(e));
		} 
		
		String msg = "其他错误！";
		if (error != null) {
			if (error.equals(UnknownAccountException.class))
				msg = "未知帐号错误！";
			else if (error.equals(IncorrectCredentialsException.class))
				msg = "密码错误！";
			else if (error.equals(IncorrectCaptchaException.class))
				msg = "验证码错误！";
			else if (error.equals(AuthenticationException.class))
				msg = "认证失败！";
			else if (error.equals(DisabledAccountException.class))
				msg = "账号被冻结！";
		}

		return "登录失败，" + msg;
	}
}

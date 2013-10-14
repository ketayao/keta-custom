package com.ketayao.ketacustom.shiro;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 该自定义类用以解决dwz在ie中不能打开登录超时页面。
 *（即使response.setHeader("X-Requested-With", "XMLHttpRequest")也不行，chrome和firefox可以，可能是IE没有的保存ajax请求的问题与IE的请求机制有关。）
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013年7月22日 下午4:00:25
 */
public class DWZUserFilter extends UserFilter {

	public final static String X_R = "X-Requested-With";
	public final static String X_R_VALUE = "XMLHttpRequest";
	
	/**
	 * 加入ajax查询参数，以便跳转至超时登录页面。
	 * 
	 * @param request
	 * @param response
	 * @throws IOException  
	 * @see org.apache.shiro.web.filter.AccessControlFilter#redirectToLogin(javax.servlet.ServletRequest, javax.servlet.ServletResponse)
	 */
	@Override
	protected void redirectToLogin(ServletRequest request,
			ServletResponse response) throws IOException {
    	HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		String xrv = httpServletRequest.getHeader(X_R);
		
		if (xrv != null && xrv.equalsIgnoreCase(X_R_VALUE)) {
			Map<String, String> queryParams = new HashMap<String, String>();
			queryParams.put("ajax", "true");
			WebUtils.issueRedirect(request, response, getLoginUrl(), queryParams);
		} else {
			super.redirectToLogin(request, response);
		}
	}
}

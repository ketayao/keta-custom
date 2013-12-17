/**
 * 
 */
package com.ketayao.utils;

import org.apache.shiro.subject.Subject;

import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.shiro.ShiroUser;

/**
 * @author KETAYAO
 *
 */
public abstract class SecurityUtils {
	public static User getLoginUser() {
		return getShiroUser().getUser();
	}
	
	public static ShiroUser getShiroUser() {
		Subject subject = getSubject();
		ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
		
		return shiroUser;
	}

	public static Subject getSubject() {
		return org.apache.shiro.SecurityUtils.getSubject();
	}
}

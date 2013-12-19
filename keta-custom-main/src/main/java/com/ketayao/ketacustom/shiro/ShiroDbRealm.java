/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.shiro.ShiroDbRealm.java
 * Class:			ShiroDbRealm
 * Date:			2012-8-2
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/

package com.ketayao.ketacustom.shiro;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.ketayao.ketacustom.entity.main.DataControl;
import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.entity.main.Role;
import com.ketayao.ketacustom.entity.main.RolePermission;
import com.ketayao.ketacustom.entity.main.RolePermissionDataControl;
import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.entity.main.UserRole;
import com.ketayao.ketacustom.service.ModuleService;
import com.ketayao.ketacustom.service.OrganizationRoleService;
import com.ketayao.ketacustom.service.UserRoleService;
import com.ketayao.ketacustom.service.UserService;
import com.ketayao.utils.Digests;
import com.ketayao.utils.Encodes;
import com.octo.captcha.service.image.ImageCaptchaService;

/**
 * 
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> Version 1.1.0
 * @since 2012-8-2 下午3:09:50
 */

public class ShiroDbRealm extends AuthorizingRealm {
	private static final Logger log = LoggerFactory.getLogger(ShiroDbRealm.class);
	
	private static final int INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	private static final String ALGORITHM = "SHA-1";

	// 是否启用超级管理员
	protected boolean activeRoot = false;
	
	// 是否使用验证码
	protected boolean useCaptcha = false;
	
	protected UserService userService;
	
	protected UserRoleService userRoleService;
	
	protected OrganizationRoleService organizationRoleService;
	
	protected ModuleService moduleService;
	
	protected ImageCaptchaService imageCaptchaService; 
	
	/**
	 * 给ShiroDbRealm提供编码信息，用于密码密码比对
	 * 描述
	 */	
	public ShiroDbRealm() {
		super();
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(ALGORITHM);
		matcher.setHashIterations(INTERATIONS);

		setCredentialsMatcher(matcher);
	}
	
	/**
	 * 认证回调函数, 登录时调用.
	 */
	// TODO 对认证进行缓存处理
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		if (useCaptcha) {
			CaptchaUsernamePasswordToken token = (CaptchaUsernamePasswordToken) authcToken;
			String parm = token.getCaptcha();
			try {
				if (!imageCaptchaService.validateResponseForID(SecurityUtils
						.getSubject().getSession().getId().toString(), parm.toLowerCase())) {//忽略大小写。
					throw new IncorrectCaptchaException("验证码错误！");
				}
			} catch (Exception e) {
				// session如果没有刷新，validateResponseForID会抛出com.octo.captcha.service.CaptchaServiceException的异常
				throw new IncorrectCaptchaException("验证码错误！");
			}
		} 
		
		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
		User user = userService.get(token.getUsername());
		if (user != null) {
			if (user.getStatus().equals("disabled")) {
				throw new DisabledAccountException();
			}
			
			byte[] salt = Encodes.decodeHex(user.getSalt());
			
			ShiroUser shiroUser = new ShiroUser(user.getId(), user.getUsername(), user);
			// 这里可以缓存认证
			return new SimpleAuthenticationInfo(shiroUser, user.getPassword(),
					ByteSource.Util.bytes(salt), getName());
		} else {
			return null;
		}
		
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Collection<?> collection = principals.fromRealm(getName());
		if (CollectionUtils.isEmpty(collection)) {
			return null;
		}
		ShiroUser shiroUser = (ShiroUser) collection.iterator().next();
		
		List<UserRole> userRoles = userRoleService.find(shiroUser.getId());
		List<OrganizationRole> organizationRoles = organizationRoleService
				.find(shiroUser.getUser().getOrganization().getId());
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(makePermissions(userRoles, organizationRoles, shiroUser));
		
		return info;
	}
	
	private Collection<String> makePermissions(List<UserRole> userRoles, List<OrganizationRole> organizationRoles, ShiroUser shiroUser) {
		// 清空shiroUser中map
		shiroUser.getHasDataControls().clear();
		shiroUser.getHasModules().clear();
		
		// 更新User
		shiroUser.setUser(userService.get(shiroUser.getId()));
		
		// 是否启用超级管理员 
		if (activeRoot) {
			// id==1为超级管理员，构造所有权限 
			if (shiroUser.getId() == 1) {
				Collection<String> stringPermissions = Sets.newHashSet();
				
				List<Module> modules = moduleService.findAll();
				StringBuilder builder = new StringBuilder();
				for (Module module : modules) {
					builder.append(module.getSn() + ",");
				}
				
				if (builder.length() > 0) {
					stringPermissions.add(builder.substring(0, builder.length() - 1));
				}
				
				if (log.isInfoEnabled()) {
					log.info("使用了超级管理员:" + shiroUser.getLoginName() + "登录了系统。At " + new Date());
					log.info(shiroUser.getLoginName() + "拥有的权限:" + stringPermissions);
				}
				return stringPermissions;
			}
		}
		
		Set<Role> roles = Sets.newHashSet();
		for (UserRole userRole : userRoles) {
			roles.add(userRole.getRole());
		}
		
		for (OrganizationRole organizationRole : organizationRoles) {
			roles.add(organizationRole.getRole());
		}
		
		Collection<String> stringPermissions = Lists.newArrayList();
		for (Role role : roles) {
			List<RolePermission> rolePermissions = role.getRolePermissions();
			for (RolePermission rolePermission : rolePermissions) {
				Permission permission = rolePermission.getPermission();
				
				String resource = permission.getModule().getSn();
				String operate = permission.getShortName();
		
				StringBuilder builder = new StringBuilder();
				builder.append(resource + ":" + operate);
				
				shiroUser.getHasModules().put(resource, permission.getModule());
				
				StringBuilder dcBuilder = new StringBuilder();
				for (RolePermissionDataControl rpdc : rolePermission.getRolePermissionDataControls()) {
					DataControl dataControl = rpdc.getDataControl();
					dcBuilder.append(dataControl.getName() + ",");
					
					shiroUser.getHasDataControls().put(dataControl.getName(), dataControl);
				}
				
				if (dcBuilder.length() > 0) {
					builder.append(":" + dcBuilder.substring(0, dcBuilder.length() - 1));
				}
				
				stringPermissions.add(builder.toString());
			}
		}

		if (log.isInfoEnabled()) {
			log.info(shiroUser.getLoginName() + "拥有的权限:" + stringPermissions);
		}
		return stringPermissions;
	}
	
	public static class HashPassword {
		public String salt;
		public String password;
	}
	
	public static HashPassword encryptPassword(String plainPassword) {
		HashPassword result = new HashPassword();
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		result.salt = Encodes.encodeHex(salt);

		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, INTERATIONS);
		result.password = Encodes.encodeHex(hashPassword);
		return result;
	}
	
	/**
	 * 
	 * 验证密码
	 * @param plainPassword 明文密码
	 * @param password 密文密码
	 * @param salt 盐值
	 * @return
	 */
	public static boolean validatePassword(String plainPassword, String password, String salt) {
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), Encodes.decodeHex(salt), INTERATIONS);
		String oldPassword = Encodes.encodeHex(hashPassword);
		return password.equals(oldPassword);
	}

	/**
	 * 更新用户授权信息缓存.
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清除所有用户授权信息缓存.
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}
	
	/**  
	 * 设置 isActiveRoot 的值  
	 * @param isActiveRoot
	 */
	public void setActiveRoot(boolean activeRoot) {
		this.activeRoot = activeRoot;
	}

	/**  
	 * 设置 useCaptcha 的值  
	 * @param useCaptcha
	 */
	public void setUseCaptcha(boolean useCaptcha) {
		this.useCaptcha = useCaptcha;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**  
	 * 设置 userRoleService 的值  
	 * @param userRoleService
	 */
	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}
	
	/**  
	 * 设置 moduleService 的值  
	 * @param moduleService
	 */
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}

	/**  
	 * 设置 organizationRoleService 的值  
	 * @param organizationRoleService
	 */
	public void setOrganizationRoleService(
			OrganizationRoleService organizationRoleService) {
		this.organizationRoleService = organizationRoleService;
	}

	public void setImageCaptchaService(ImageCaptchaService imageCaptchaService) {
		this.imageCaptchaService = imageCaptchaService;
	}
}

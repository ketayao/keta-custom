/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.controller.UserController.java
 * Class:			UserController
 * Date:			2012-8-7
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Validator;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.beanvalidator.BeanValidators;

import com.google.common.collect.Lists;
import com.ketayao.ketacustom.entity.main.Organization;
import com.ketayao.ketacustom.entity.main.Role;
import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.entity.main.UserRole;
import com.ketayao.ketacustom.exception.ExistedException;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.service.OrganizationService;
import com.ketayao.ketacustom.service.RoleService;
import com.ketayao.ketacustom.service.UserRoleService;
import com.ketayao.ketacustom.service.UserService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-7 下午3:12:23 
 */
@Controller
@RequestMapping("/management/security/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	UserRoleService userRoleService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private Validator validator;
	
	private static final String CREATE = "management/security/user/create";
	private static final String UPDATE = "management/security/user/update";
	private static final String LIST = "management/security/user/list";
	private static final String LOOK_UP_ROLE = "management/security/user/assign_user_role";
	private static final String LOOK_USER_ROLE = "management/security/user/delete_user_role";
	private static final String LOOK_ORG = "management/security/user/lookup_org";
	
	@RequiresPermissions("User:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate() {
		return CREATE;
	}
	
	@RequiresPermissions("User:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(User user) {	
		BeanValidators.validateWithException(validator, user);
		
		user.setCreateTime(new Date());
		
		try {
			userService.save(user);
		} catch (ExistedException e) {
			AjaxObject ajaxObject = new AjaxObject(e.getMessage());
			ajaxObject.setCallbackType("");
			ajaxObject.setStatusCode(AjaxObject.STATUS_CODE_FAILURE);
			return ajaxObject.toString();
		}
		
		//AjaxObject ajaxObject = AjaxObject.newRefresh("accordion_3", "添加用户成功！");
		return AjaxObject.newOk("添加用户成功！").toString();
	}
	
	@ModelAttribute("preloadUser")
	public User getOne(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			User user = userService.get(id);
			user.setOrganization(null);
			return user;
		}
		return null;
	}
	
	@RequiresPermissions("User:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		User user = userService.get(id);
		
		map.put("user", user);
		return UPDATE;
	}
	
	@RequiresPermissions("User:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@ModelAttribute("preloadUser")User user) {
		BeanValidators.validateWithException(validator, user);
		userService.update(user);
		
		return	AjaxObject.newOk("编辑用户成功！").toString(); 
	}
	
	@RequiresPermissions("User:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		AjaxObject ajaxObject = new AjaxObject("删除用户成功！");
		try {
			userService.delete(id);
		} catch (ServiceException e) {
			ajaxObject.setMessage(e.getMessage());
		}
		
		//AjaxObject ajaxObject = new AjaxObject("用户删除成功");
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("User:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, String keywords, Map<String, Object> map) {
		List<User> users;
		if (StringUtils.isNotBlank(keywords)) {
			users = userService.find(page, keywords);
		} else {
			users = userService.findAll(page);
		}
		
		map.put("page", page);
		map.put("users", users);
		map.put("keywords", keywords);
		return LIST;
	}
	
	@RequiresPermissions("User:reset")
	@RequestMapping(value="/reset/{type}/{userId}", method=RequestMethod.POST)
	public @ResponseBody String reset(@PathVariable String type, @PathVariable Long userId) {
		User user = userService.get(userId);
		AjaxObject ajaxObject = new AjaxObject();
		if (type.equals("password")) {
			user.setPlainPassword("123456");
			
			ajaxObject.setMessage("重置密码成功，默认为123456！"); 
		} else if (type.equals("status")) {
			if (user.getStatus().equals("enabled")) {
				user.setStatus("disabled");
			} else {
				user.setStatus("enabled");
			}
			
			ajaxObject.setMessage("更新状态成功，当前为" + (user.getStatus().equals("enabled")?"可用":"不可用"));
		}
		
		userService.update(user);
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/create/userRole", method={RequestMethod.POST})
	public @ResponseBody void assignRole(UserRole userRole) {
		userRoleService.save(userRole);
	}
	
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/lookup2create/userRole/{userId}", method={RequestMethod.GET, RequestMethod.POST})
	public String listUnassignRole(Map<String, Object> map, @PathVariable Long userId) {
		Page page = new Page();
		page.setNumPerPage(Integer.MAX_VALUE);
		
		List<UserRole> userRoles = userRoleService.find(userId);
		List<Role> roles = roleService.findAll(page);
		
		List<Role> rentList = Lists.newArrayList();
		// 删除已分配roles
		for (Role role : roles) {
			boolean isHas = false;
			for (UserRole or : userRoles) {
				if (or.getRole().getId().equals(role.getId())) {
					isHas = true;
					break;
				} 
			}
			if (isHas == false) {
				rentList.add(role);
			}
		}
		
		map.put("userRoles", userRoles);
		map.put("roles", rentList);
		
		map.put("userId", userId);
		return LOOK_UP_ROLE;
	}
	
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/lookup2delete/userRole/{userId}", method={RequestMethod.GET, RequestMethod.POST})
	public String listUserRole(Map<String, Object> map, @PathVariable Long userId) {
		List<UserRole> userRoles = userRoleService.find(userId);
		map.put("userRoles", userRoles);
		return LOOK_USER_ROLE;
	}
	
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/delete/userRole/{userRoleId}", method={RequestMethod.POST})
	public @ResponseBody void deleteUserRole(@PathVariable Long userRoleId) {
		userRoleService.delete(userRoleId);
	}
	
	@RequiresPermissions(value={"User:edit", "User:save"}, logical=Logical.OR)
	@RequestMapping(value="/lookup2org", method={RequestMethod.GET})
	public String lookup(Map<String, Object> map) {
		Organization org = organizationService.getTree();
		
		map.put("org", org);
		return LOOK_ORG;
	}
}

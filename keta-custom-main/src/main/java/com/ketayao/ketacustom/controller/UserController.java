/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ketayao.ketacustom.entity.main.Organization;
import com.ketayao.ketacustom.entity.main.Role;
import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.entity.main.UserRole;
import com.ketayao.ketacustom.exception.ExistedException;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.service.OrganizationService;
import com.ketayao.ketacustom.service.RoleService;
import com.ketayao.ketacustom.service.UserRoleService;
import com.ketayao.ketacustom.service.UserService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;

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
	
	@Log(message="添加了{0}用户。")
	@RequiresPermissions("User:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid User user) {	
		user.setCreateTime(new Date());
		try {
			userService.saveOrUpdate(user);
		} catch (ExistedException e) {
			return AjaxObject.newError("添加用户失败：" + e.getMessage()).setCallbackType("").toString();
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{user.getUsername()}));
		return AjaxObject.newOk("添加用户成功！").toString();
	}
	
	@ModelAttribute("preloadUser")
	public User preload(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			User user = userService.get(id);
			user.setOrganization(null);
			return user;
		}
		return null;
	}
	
	@RequiresPermissions("User:edit:User拥有的资源")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		User user = userService.get(id);
		
		map.put("user", user);
		return UPDATE;
	}
	
	@Log(message="修改了{0}用户的信息。")
	@RequiresPermissions("User:edit:User拥有的资源")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid @ModelAttribute("preloadUser")User user) {
		userService.saveOrUpdate(user);
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{user.getUsername()}));
		return	AjaxObject.newOk("修改用户成功！").toString(); 
	}
	
	@Log(message="删除了{0}用户。")
	@RequiresPermissions("User:delete:User拥有的资源")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		User user = null;
		try {
			user = userService.get(id);
			userService.delete(user.getId());
		} catch (ServiceException e) {
			return AjaxObject.newError("删除用户失败：" + e.getMessage()).setCallbackType("").toString();
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{user.getUsername()}));
		return AjaxObject.newOk("删除用户成功！").setCallbackType("").toString();
	}
	
	@Log(message="删除了{0}用户。")
	@RequiresPermissions("User:delete:User拥有的资源")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		String[] usernames = new String[ids.length];
		try {
			for (int i = 0; i < ids.length; i++) {
				User user = userService.get(ids[i]);
				userService.delete(user.getId());
				
				usernames[i] = user.getUsername();
			}
		} catch (ServiceException e) {
			return AjaxObject.newError("删除用户失败：" + e.getMessage()).setCallbackType("").toString();
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{Arrays.toString(usernames)}));
		return AjaxObject.newOk("删除用户成功！").setCallbackType("").toString();
	}
	
	@RequiresPermissions("User:view:User拥有的资源")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(ServletRequest request, Page page, Map<String, Object> map) {
		Specification<User> specification = DynamicSpecifications.bySearchFilter(request, User.class);
		List<User> users = userService.findByExample(specification, page);

		map.put("page", page);
		map.put("users", users);
		return LIST;
	}
	
	@Log(message="{0}用户{1}")
	@RequiresPermissions("User:reset:User拥有的资源")
	@RequestMapping(value="/reset/{type}/{userId}", method=RequestMethod.POST)
	public @ResponseBody String reset(@PathVariable String type, @PathVariable Long userId) {
		User user = userService.get(userId);
		AjaxObject ajaxObject = new AjaxObject();
		ajaxObject.setCallbackType("");
		
		if (type.equals("password")) {
			userService.resetPwd(user, "123456");
			ajaxObject.setMessage("重置密码成功，默认为123456！");
		} else if (type.equals("status")) {
			if (user.getStatus().equals("enabled")) {
				user.setStatus("disabled");
			} else {
				user.setStatus("enabled");
			}
			
			ajaxObject.setMessage("更新状态成功，当前为" + (user.getStatus().equals(User.STATUS_ENABLED)?"可用":"不可用"));
			
			userService.saveOrUpdate(user);
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{user.getUsername(), ajaxObject.getMessage()}));
		return ajaxObject.toString();
	}
	
	@Log(message="向{0}用户分配了{1}的角色。")
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/create/userRole", method={RequestMethod.POST})
	public @ResponseBody void assignRole(UserRole userRole) {
		userRoleService.saveOrUpdate(userRole);
		
		User user = userService.get(userRole.getUser().getId());
		Role role = roleService.get(userRole.getRole().getId());
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{user.getUsername(), role.getName()}));
	}
	
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/lookup2create/userRole/{userId}", method={RequestMethod.GET, RequestMethod.POST})
	public String listUnassignRole(Map<String, Object> map, @PathVariable Long userId) {
		Page page = new Page();
		page.setNumPerPage(Integer.MAX_VALUE);
		
		List<UserRole> userRoles = userRoleService.findByUserId(userId);
		List<Role> roles = roleService.findAll(page);
		
		List<Role> rentList = new ArrayList<Role>();
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
		List<UserRole> userRoles = userRoleService.findByUserId(userId);
		map.put("userRoles", userRoles);
		return LOOK_USER_ROLE;
	}
	
	@Log(message="撤销了{0}用户的{1}角色。")
	@RequiresPermissions("User:assign")
	@RequestMapping(value="/delete/userRole/{userRoleId}", method={RequestMethod.POST})
	public @ResponseBody void deleteUserRole(@PathVariable Long userRoleId) {
		UserRole userRole = userRoleService.get(userRoleId);
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{userRole.getUser().getUsername(), userRole.getRole().getName()}));
		
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

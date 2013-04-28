/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.controller.OrganizationController.java
 * Class:			OrganizationController
 * Date:			2012-8-27
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Validator;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.beanvalidator.BeanValidators;

import com.google.common.collect.Lists;
import com.ketayao.ketacustom.entity.main.Organization;
import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.entity.main.Role;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.service.OrganizationRoleService;
import com.ketayao.ketacustom.service.OrganizationService;
import com.ketayao.ketacustom.service.RoleService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-27 下午4:10:26 
 */
@Controller
@RequestMapping("/management/security/organization")
public class OrganizationController {
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private OrganizationRoleService organizationRoleService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private Validator validator;
	
	private static final String CREATE = "management/security/organization/create";
	private static final String UPDATE = "management/security/organization/update";
	private static final String LIST = "management/security/organization/list";
	private static final String TREE = "management/security/organization/tree";
	
	private static final String LOOK_UP_ROLE = "management/security/organization/assign_organization_role";
	private static final String LOOK_ORGANIZATION_ROLE = "management/security/organization/delete_organization_role";
	
	@RequiresPermissions("Organization:save")
	@RequestMapping(value="/create/{parentOrganizationId}", method=RequestMethod.GET)
	public String preCreate(@PathVariable Long parentOrganizationId, Map<String, Object> map) {
		map.put("parentOrganizationId", parentOrganizationId);
		return CREATE;
	}
	
	@RequiresPermissions("Organization:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(Organization organization) {
		BeanValidators.validateWithException(validator, organization);
		
		Organization parentOrganization = organizationService.get(organization.getParent().getId());
		if (parentOrganization == null) {
			return AjaxObject.newError("模块组织失败：id=" + organization.getParent().getId() + "的父组织不存在！").toString();
		}
		organizationService.save(organization);
		
		return AjaxObject.newOk("添加组织成功！").toString();
	}
	
	@RequiresPermissions("Organization:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Organization organization = organizationService.get(id);
		
		map.put("organization", organization);
		return UPDATE;
	}
	
	@RequiresPermissions("Organization:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(Organization organization) {
		BeanValidators.validateWithException(validator, organization);
		organizationService.update(organization);
		
		return AjaxObject.newOk("修改组织成功！").toString();
	}
	
	@RequiresPermissions("Organization:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		AjaxObject ajaxObject = new AjaxObject();
		try {
			organizationService.delete(id);
			ajaxObject.setMessage("删除组织成功！");
		} catch (ServiceException e) {
			ajaxObject.setStatusCode(AjaxObject.STATUS_CODE_FAILURE);
			ajaxObject.setMessage("删除组织失败：" + e.getMessage());
		}
		
		ajaxObject.setCallbackType("");
		//ajaxObject.setRel("jbsxBox2organization");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("Organization:view")
	@RequestMapping(value="/tree", method=RequestMethod.GET)
	public String tree(Map<String, Object> map) {
		Organization organization = organizationService.getTree();
		
		map.put("organization", organization);
		return TREE;
	}
	
	@RequiresPermissions("Organization:view")
	@RequestMapping(value="/list/{parentOrganizationId}", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, @PathVariable Long parentOrganizationId, String keywords, 
			Map<String, Object> map) {
		List<Organization> organizations = null;
		if (StringUtils.isNotBlank(keywords)) {
			organizations = organizationService.find(parentOrganizationId, keywords, page);
		} else {
			organizations = organizationService.find(parentOrganizationId, page);
		}
		
		map.put("page", page);
		map.put("organizations", organizations);
		map.put("keywords", keywords);
		map.put("parentOrganizationId", parentOrganizationId);

		return LIST;
	}
	
	/**
	 * 给组织分配权限
	 * 描述
	 * @param userRole
	 */
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/create/organizationRole", method={RequestMethod.POST})
	public @ResponseBody void assignRole(OrganizationRole organizationRole) {
		organizationRoleService.save(organizationRole);
	}
	
	/**
	 * 展示没有分配到组织的其他权限
	 * 描述
	 * @param map
	 * @param organizationId
	 * @return
	 */
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/lookup2create/organizationRole/{organizationId}", method={RequestMethod.GET, RequestMethod.POST})
	public String listUnassignRole(Map<String, Object> map, @PathVariable Long organizationId) {
		Page page = new Page();
		page.setNumPerPage(Integer.MAX_VALUE);
		
		List<OrganizationRole> organizationRoles = organizationRoleService.find(organizationId);
		List<Role> roles = roleService.findAll(page);
		
		List<Role> rentList = Lists.newArrayList();
		// 删除已分配roles
		for (Role role : roles) {
			boolean isHas = false;
			for (OrganizationRole or : organizationRoles) {
				if (or.getRole().getId().equals(role.getId())) {
					isHas = true;
					break;
				} 
			}
			if (isHas == false) {
				rentList.add(role);
			}
		}
		
		map.put("organizationRoles", organizationRoles);
		map.put("roles", rentList);
		
		map.put("organizationId", organizationId);
		return LOOK_UP_ROLE;
	}
	
	/**
	 * 显示组织已分配的权限
	 * 描述
	 * @param map
	 * @param organizationId
	 * @return
	 */
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/lookup2delete/organizationRole/{organizationId}", method={RequestMethod.GET, RequestMethod.POST})
	public String listOrganizationRole(Map<String, Object> map, @PathVariable Long organizationId) {
		List<OrganizationRole> organizationRoles = organizationRoleService.find(organizationId);
		map.put("organizationRoles", organizationRoles);
		return LOOK_ORGANIZATION_ROLE;
	}
	
	/**
	 * 删除组织分配的权限
	 * 描述
	 * @param organizationId
	 */
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/delete/organizationRole/{organizationRoleId}", method={RequestMethod.POST})
	public @ResponseBody void deleteOrganizationRole(@PathVariable Long organizationRoleId) {
		organizationRoleService.delete(organizationRoleId);
	}
}

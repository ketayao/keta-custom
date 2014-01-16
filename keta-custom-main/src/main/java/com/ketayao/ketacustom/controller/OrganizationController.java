/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.controller;

import java.util.ArrayList;
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
import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.entity.main.Role;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.service.OrganizationRoleService;
import com.ketayao.ketacustom.service.OrganizationService;
import com.ketayao.ketacustom.service.RoleService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.util.persistence.SearchFilter;
import com.ketayao.ketacustom.util.persistence.SearchFilter.Operator;

@Controller
@RequestMapping("/management/security/organization")
public class OrganizationController {
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private OrganizationRoleService organizationRoleService;
	
	@Autowired
	private RoleService roleService;
	
	private static final String CREATE = "management/security/organization/create";
	private static final String UPDATE = "management/security/organization/update";
	private static final String LIST = "management/security/organization/list";
	private static final String TREE = "management/security/organization/tree";
	private static final String TREE_LIST = "management/security/organization/tree_list";
	
	private static final String LOOK_UP_ROLE = "management/security/organization/assign_organization_role";
	private static final String LOOK_ORGANIZATION_ROLE = "management/security/organization/delete_organization_role";
	
	private static final String LOOKUP_PARENT = "management/security/organization/lookup_parent";
	
	@RequiresPermissions("Organization:save")
	@RequestMapping(value="/create/{parentOrganizationId}", method=RequestMethod.GET)
	public String preCreate(@PathVariable Long parentOrganizationId, Map<String, Object> map) {
		map.put("parentOrganizationId", parentOrganizationId);
		return CREATE;
	}
	
	@Log(message="添加了{0}组织。")
	@RequiresPermissions("Organization:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid Organization organization) {
		try {
			organizationService.saveOrUpdate(organization);
		} catch (ServiceException e) {
			return AjaxObject.newError("添加组织失败：" + e.getMessage()).toString();
		}
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{organization.getName()}));
		return AjaxObject.newOk("添加组织成功！").toString();
	}
	
	@ModelAttribute("preloadOrg")
	public Organization preload(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			Organization organization = organizationService.get(id);
			organization.setParent(null);
			return organization;
		}
		return null;
	}
	
	@RequiresPermissions("Organization:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Organization organization = organizationService.get(id);
		
		map.put("organization", organization);
		return UPDATE;
	}
	
	@Log(message="修改了{0}组织的信息。")
	@RequiresPermissions("Organization:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid @ModelAttribute("preloadOrg")Organization organization) {
		organizationService.saveOrUpdate(organization);
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{organization.getName()}));
		return AjaxObject.newOk("修改组织成功！").toString();
	}
	
	@Log(message="删除了{0}组织。")
	@RequiresPermissions("Organization:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		Organization organization = organizationService.get(id);
		try {
			organizationService.delete(id);
		} catch (ServiceException e) {
			return AjaxObject.newError("删除组织失败：" + e.getMessage()).setCallbackType("").toString();
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{organization.getName()}));
		return AjaxObject.newOk("删除组织成功！").setCallbackType("").toString();
	}
	
	@RequiresPermissions("Organization:view")
	@RequestMapping(value="/tree_list", method={RequestMethod.GET, RequestMethod.POST})
	public String tree_list(Map<String, Object> map) {
		return TREE_LIST;
	}
	
	@RequiresPermissions("Organization:view")
	@RequestMapping(value="/tree", method={RequestMethod.GET, RequestMethod.POST})
	public String tree(Map<String, Object> map) {
		Organization organization = organizationService.getTree();
		
		map.put("organization", organization);
		return TREE;
	}
	
	@RequiresPermissions("Organization:view")
	@RequestMapping(value="/list/{parentOrganizationId}", method={RequestMethod.GET, RequestMethod.POST})
	public String list(ServletRequest request, Page page, @PathVariable Long parentOrganizationId, 
			Map<String, Object> map) {
		Specification<Organization> specification = DynamicSpecifications.bySearchFilter(request, Organization.class,
				new SearchFilter("parent.id", Operator.EQ, parentOrganizationId));
		List<Organization> organizations = organizationService.findByExample(specification, page);
		
		map.put("page", page);
		map.put("organizations", organizations);
		map.put("parentOrganizationId", parentOrganizationId);

		return LIST;
	}
	
	/**
	 * 给组织分配权限
	 * 描述
	 * @param userRole
	 */
	@Log(message="向{0}组织分配了{1}的角色。")
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/create/organizationRole", method={RequestMethod.POST})
	public @ResponseBody void assignRole(OrganizationRole organizationRole) {
		organizationRoleService.saveOrUpdate(organizationRole);
		
		Organization organization = organizationService.get(organizationRole.getOrganization().getId());
		Role role = roleService.get(organizationRole.getRole().getId());
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{organization.getName(), role.getName()}));
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
		
		List<OrganizationRole> organizationRoles = organizationRoleService.findByOrganizationId(organizationId);
		List<Role> roles = roleService.findAll(page);
		
		List<Role> rentList = new ArrayList<Role>();
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
		List<OrganizationRole> organizationRoles = organizationRoleService.findByOrganizationId(organizationId);
		map.put("organizationRoles", organizationRoles);
		return LOOK_ORGANIZATION_ROLE;
	}
	
	/**
	 * 删除组织分配的角色
	 * 描述
	 * @param organizationId
	 */
	@Log(message="撤销了{0}组织的{1}角色。")
	@RequiresPermissions("Organization:assign")
	@RequestMapping(value="/delete/organizationRole/{organizationRoleId}", method={RequestMethod.POST})
	public @ResponseBody void deleteOrganizationRole(@PathVariable Long organizationRoleId) {
		OrganizationRole organizationRole = organizationRoleService.get(organizationRoleId);
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{organizationRole.getOrganization().getName(), organizationRole.getRole().getName()}));
		
		organizationRoleService.delete(organizationRoleId);
	}
	
	@RequiresPermissions(value={"Organization:edit", "Organization:save"}, logical=Logical.OR)
	@RequestMapping(value="/lookupParent/{id}", method={RequestMethod.GET})
	public String lookup(@PathVariable Long id, Map<String, Object> map) {
		Organization organization  = organizationService.getTree();
		
		map.put("organization", organization);
		return LOOKUP_PARENT;
	}
}

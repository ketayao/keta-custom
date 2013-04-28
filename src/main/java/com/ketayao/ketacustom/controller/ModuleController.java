/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.controller.ModuleController.java
 * Class:			ModuleController
 * Date:			2012-8-6
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
import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.exception.ExistedException;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.service.ModuleService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-6 上午10:08:48 
 */
@Controller
@RequestMapping("/management/security/module")
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	
	@Autowired
	private Validator validator;
	
	private static final String CREATE = "management/security/module/create";
	private static final String UPDATE = "management/security/module/update";
	private static final String LIST = "management/security/module/list";
	private static final String TREE = "management/security/module/tree";
	private static final String VIEW = "management/security/module/view";
	
	@RequiresPermissions("Module:save")
	@RequestMapping(value="/create/{parentModuleId}", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map, @PathVariable Long parentModuleId) {
		map.put("parentModuleId", parentModuleId);
		return CREATE;
	}
	
	@RequiresPermissions("Module:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(Module module) {
		BeanValidators.validateWithException(validator, module);
		
		Module parentModule = moduleService.get(module.getParent().getId());
		if (parentModule == null) {
			return AjaxObject.newError("模块添加失败：id=" + module.getParent().getId() + "的父模块不存在！").toString();
		}
		
		List<Permission> permissions = Lists.newArrayList();
		for (Permission permission : module.getPermissions()) {
			if (StringUtils.isNotBlank(permission.getShortName())) {
				permissions.add(permission);
			}
		}
		
		for (Permission permission : permissions) {
			permission.setModule(module);
		}
		module.setPermissions(permissions);
		
		try {
			moduleService.save(module);
		} catch (ExistedException e) {
			return AjaxObject.newError("模块添加失败：" + e.getMessage()).toString();
		}
		
		return AjaxObject.newOk("模块添加成功！").toString();
	}
	
	@RequiresPermissions("Module:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Module module = moduleService.get(id);
		
		map.put("module", module);
		return UPDATE;
	}
	
	@RequiresPermissions("Module:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(Module module) {
		BeanValidators.validateWithException(validator, module);
		
		Module oldModule = moduleService.get(module.getId());
		oldModule.setName(module.getName());
		oldModule.setPriority(module.getPriority());
		oldModule.setDescription(module.getDescription());
		oldModule.setSn(module.getSn());
		oldModule.setUrl(module.getUrl());
		
		for (Permission permission : module.getPermissions()) {
			if (StringUtils.isNotBlank(permission.getShortName())) {
				if (permission.getId() == null) {
					permission.setModule(oldModule);
					oldModule.getPermissions().add(permission);
				}
			} else {
				if (permission.getId() != null) {
					for (Permission oldPermission : oldModule.getPermissions()) {
						if (oldPermission.getId().equals(permission.getId())) {
							oldPermission.setModule(null);
							permission = oldPermission;
							break;
						}
					}
					oldModule.getPermissions().remove(permission);
				}
			}
		}
		
		moduleService.update(oldModule);
		
		return AjaxObject.newOk("模块修改成功！").toString();
	}
	
	@RequiresPermissions("Module:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		AjaxObject ajaxObject = new AjaxObject();
		try {
			moduleService.delete(id);
			ajaxObject.setMessage("模块删除成功！");
		} catch (ServiceException e) {
			ajaxObject.setStatusCode(AjaxObject.STATUS_CODE_FAILURE);
			ajaxObject.setMessage("模块删除失败：" + e.getMessage());
		}
		
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("Module:view")
	@RequestMapping(value="/tree", method=RequestMethod.GET)
	public String tree(Map<String, Object> map) {
		Module module = moduleService.getTree();
		
		map.put("module", module);
		return TREE;
	}
	
	@RequiresPermissions("Module:view")
	@RequestMapping(value="/list/{parentModuleId}", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, @PathVariable Long parentModuleId, String keywords, 
			Map<String, Object> map) {
		List<Module> modules = null;
		if (StringUtils.isNotBlank(keywords)) {
			modules = moduleService.find(parentModuleId, keywords, page);
		} else {
			modules = moduleService.find(parentModuleId, page);
		}
		
		map.put("page", page);
		map.put("modules", modules);
		map.put("keywords", keywords);
		map.put("parentModuleId", parentModuleId);

		return LIST;
	}
	
	@RequiresPermissions("Module:view")
	@RequestMapping(value="/view/{id}", method={RequestMethod.GET})
	public String view(@PathVariable Long id, Map<String, Object> map) {
		Module module = moduleService.get(id);
		
		map.put("module", module);
		return VIEW;
	}
}

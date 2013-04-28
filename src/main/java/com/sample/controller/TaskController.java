/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.sample.controller.TaskController.java
 * Class:			TaskController
 * Date:			2013-4-21
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.sample.controller;

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

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.sample.entity.Task;
import com.sample.service.TaskService;

/** 
 * 莫紧张，仅仅是一个例子。	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-21 下午8:43:54 
 */
@Controller
@RequestMapping("/management/sample/task")
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@Autowired
	private Validator validator;
	
	private static final String CREATE = "management/sample/task/create";
	private static final String UPDATE = "management/sample/task/update";
	private static final String LIST = "management/sample/task/list";
	private static final String VIEW = "management/sample/task/view";
	
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map) {
		return CREATE;
	}
	
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(Task task) {
		BeanValidators.validateWithException(validator, task);
		taskService.save(task);
		
		return AjaxObject.newOk("任务添加成功！").toString();
	}
	
	@RequiresPermissions("Task:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Task task = taskService.get(id);
		
		map.put("task", task);
		return UPDATE;
	}
	
	@RequiresPermissions("Task:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(Task task) {
		BeanValidators.validateWithException(validator, task);
		taskService.update(task);

		return AjaxObject.newOk("任务修改成功！").toString();
	}
	
	@RequiresPermissions("Task:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		
		taskService.delete(id);

		AjaxObject ajaxObject = new AjaxObject("任务删除成功！");
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("Task:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, String keywords, Map<String, Object> map) {
		List<Task> tasks = null;
		if (StringUtils.isNotBlank(keywords)) {
			tasks = taskService.find(page, keywords);
		} else {
			tasks = taskService.findAll(page);
		}

		map.put("page", page);
		map.put("tasks", tasks);
		map.put("keywords", keywords);
		return LIST;
	}
	
	/**
	 * 自定look权限，实例。
	 * 描述
	 * @param id
	 * @param map
	 * @return
	 */
	@RequiresPermissions("Task:look")
	@RequestMapping(value="/view/{id}", method={RequestMethod.GET})
	public String view(@PathVariable Long id, Map<String, Object> map) {
		Task task = taskService.get(id);
		map.put("task", task);
		return VIEW;
	}
}

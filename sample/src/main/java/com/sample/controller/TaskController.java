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

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogLevel;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitl;
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
	
	private static final String CREATE = "management/sample/task/create";
	private static final String UPDATE = "management/sample/task/update";
	private static final String LIST = "management/sample/task/list";
	private static final String VIEW = "management/sample/task/view";
	
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map) {
		return CREATE;
	}
	
	/**
	 * LogMessageObject的write用法实例。
	 */
	@Log(message="添加了{0}任务，LogMessageObject的isWritten为true。", level=LogLevel.INFO)
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid Task task) {
		taskService.save(task);
		
		// 加入一个LogMessageObject，该对象的isWritten为true，会记录日志。
		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{task.getTitle()}));
		return AjaxObject.newOk("任务添加成功！").toString();
	}
	
	/**
	 * LogMessageObject的ignore用法实例，ignore不会记录日志。
	 */
	@Log(message="你永远不会看见该日志，LogMessageObject的isWritten为false。", level=LogLevel.INFO)
	@RequiresPermissions("Task:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Task task = taskService.get(id);
		
		map.put("task", task);
		
		// 加入一个LogMessageObject，该对象的isWritten为false，不会记录日志。
		LogUitl.putArgs(LogMessageObject.newIgnore());
		return UPDATE;
	}
	
	/**
	 * Log的level用法实例
	 * 1.level分为三层，默认包层（rootLogLevel默认值TRACE），自定义包层（customLogLevel），具体方法层（@Log默认值TRACE）
	 * 2.参考顺序：默认包层->自定义包层->具体方法层->LogMessageObject
	 * 3.有自定义包层的level等级会忽略默认包层
	 * 4.@Log的level大于等于自定义包层或者默认的level会输出日志；小于则不会。
	 */
	@Log(message="Log的level用法实例，LogLevel.TRACE小于自定义包层LogLevel.INFO，不会输出日志。", level=LogLevel.TRACE)
	@RequiresPermissions("Task:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid Task task) {
		taskService.update(task);

		return AjaxObject.newOk("任务修改成功！").toString();
	}

	@RequiresPermissions("Task:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		taskService.delete(id);

		return AjaxObject.newOk("任务删除成功！").setCallbackType("").toString();
	}
	
	
	/**
	 * Log的override用法实例
	 * 假如override为true，会忽略掉level
	 * 
	 * 批量删除展示
	 */
	@Log(message="Log的override用法实例，override为true，会忽略掉level。删除了{0}任务。", level=LogLevel.TRACE, override=true)
	@RequiresPermissions("Task:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		String[] titles = new String[ids.length];
		for (int i = 0; i < ids.length; i++) {
			Task task = taskService.get(ids[i]);
			taskService.delete(task.getId());
			
			titles[i] = task.getTitle();
		}
		
		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{Arrays.toString(titles)}));
		return AjaxObject.newOk("任务删除成功！").setCallbackType("").toString();
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

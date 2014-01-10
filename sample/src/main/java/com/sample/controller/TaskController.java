/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.sample.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletRequest;

import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.sample.entity.Task;
import com.sample.service.TaskService;

@Controller
@RequestMapping("/management/demo/task")
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	private static final String CREATE = "management/demo/task/create";
	private static final String UPDATE = "management/demo/task/update";
	private static final String LIST = "management/demo/task/list";
	private static final String VIEW = "management/demo/task/view";
	
	@InitBinder
	public void dataBinder(WebDataBinder dataBinder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		dataBinder.registerCustomEditor(Date.class, 
				new CustomDateEditor(df, true));
	}
	
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map) {
		return CREATE;
	}
	
	@Log(message="添加了id={0}任务。")
	@RequiresPermissions("Task:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid Task task) {
		taskService.saveOrUpdate(task);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{task.getId()}));
		return AjaxObject.newOk("任务添加成功！").toString();
	}
	
	@ModelAttribute("preloadTask")
	public Task preload(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			Task task = taskService.get(id);
			return task;
		}
		return null;
	}
	
	@RequiresPermissions("Task:edit:User关联的资源")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Task task = taskService.get(id);
		map.put("task", task);
		return UPDATE;
	}
	
	@Log(message="修改了id={0}任务的信息。")
	@RequiresPermissions("Task:edit:User关联的资源")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid @ModelAttribute("preloadTask")Task task) {
		taskService.saveOrUpdate(task);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{task.getId()}));
		return AjaxObject.newOk("任务修改成功！").toString();
	}

	@Log(message="删除了id={0}任务。")
	@RequiresPermissions("Task:delete:User关联的资源")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		taskService.delete(id);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{id}));
		return AjaxObject.newOk("任务删除成功！").setCallbackType("").toString();
	}
	
	@Log(message="批量删除了id={0}任务。")
	@RequiresPermissions("Task:delete:User关联的资源")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		for (int i = 0; i < ids.length; i++) {
			Task task = taskService.get(ids[i]);
			taskService.delete(task.getId());
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{Arrays.toString(ids)}));
		return AjaxObject.newOk("任务删除成功！").setCallbackType("").toString();
	}

	@RequiresPermissions("Task:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(ServletRequest request, Page page, Map<String, Object> map) {
		Specification<Task> specification = DynamicSpecifications.bySearchFilter(request, Task.class);
		List<Task> tasks = taskService.findByExample(specification, page);
		
		map.put("page", page);
		map.put("tasks", tasks);

		return LIST;
	}
	
	@RequiresPermissions("Task:view")
	@RequestMapping(value="/view/{id}", method={RequestMethod.GET})
	public String view(@PathVariable Long id, Map<String, Object> map) {
		Task task = taskService.get(id);
		map.put("task", task);
		return VIEW;
	}
}

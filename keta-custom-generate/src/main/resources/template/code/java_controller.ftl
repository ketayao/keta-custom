/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package ${pknController};

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

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitl;
import ${pknEntity}.${className};
import ${pknService}.${className}Service;

@Controller
@RequestMapping("/${requestMapping}")
public class ${className}Controller {

	@Autowired
	private ${className}Service ${instanceName}Service;
	
	private static final String CREATE = "${requestMapping}/create";
	private static final String UPDATE = "${requestMapping}/update";
	private static final String LIST = "${requestMapping}/list";
	private static final String VIEW = "${requestMapping}/view";
	
	@RequiresPermissions("${className}:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map) {
		return CREATE;
	}
	
	@Log(message="添加了id={0}${functionName}。")
	@RequiresPermissions("${className}:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid ${className} ${instanceName}) {
		${instanceName}Service.save(${instanceName});

		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{${instanceName}.getId()}));
		return AjaxObject.newOk("${functionName}添加成功！").toString();
	}
	
	@RequiresPermissions("${className}:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		${className} ${instanceName} = ${instanceName}Service.get(id);
		map.put("${instanceName}", ${instanceName});
		return UPDATE;
	}
	
	@Log(message="修改了id={0}${functionName}的信息。")
	@RequiresPermissions("${className}:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid ${className} ${instanceName}) {
		${instanceName}Service.update(${instanceName});

		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{${instanceName}.getId()}));
		return AjaxObject.newOk("${functionName}修改成功！").toString();
	}

	@Log(message="删除了id={0}${functionName}。")
	@RequiresPermissions("${className}:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		${instanceName}Service.delete(id);

		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{id}));
		return AjaxObject.newOk("${functionName}删除成功！").setCallbackType("").toString();
	}
	
	@Log(message="批量删除了id={0}${functionName}。")
	@RequiresPermissions("${className}:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		for (int i = 0; i < ids.length; i++) {
			${className} ${instanceName} = ${instanceName}Service.get(ids[i]);
			${instanceName}Service.delete(${instanceName}.getId());
		}
		
		LogUitl.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{Arrays.toString(ids)}));
		return AjaxObject.newOk("${functionName}删除成功！").setCallbackType("").toString();
	}

	@RequiresPermissions("${className}:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Page page, String keywords, Map<String, Object> map) {
		List<${className}> ${instanceName}s = null;
		if (StringUtils.isNotBlank(keywords)) {
			${instanceName}s = ${instanceName}Service.find(page, keywords);
		} else {
			${instanceName}s = ${instanceName}Service.findAll(page);
		}

		map.put("page", page);
		map.put("${instanceName}s", ${instanceName}s);
		map.put("keywords", keywords);

		return LIST;
	}
	
	@RequiresPermissions("${className}:look")
	@RequestMapping(value="/view/{id}", method={RequestMethod.GET})
	public String view(@PathVariable Long id, Map<String, Object> map) {
		${className} ${instanceName} = ${instanceName}Service.get(id);
		map.put("${instanceName}", ${instanceName});
		return VIEW;
	}
}

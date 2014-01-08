/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.controller.system;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

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

import com.ketayao.ketacustom.entity.main.Dictionary;
import com.ketayao.ketacustom.entity.main.Dictionary.DictionaryType;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.service.DictionaryService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.util.persistence.SearchFilter;
import com.ketayao.ketacustom.util.persistence.SearchFilter.Operator;

@Controller
@RequestMapping("/management/system/dictionary")
public class DictionaryController {

	@Autowired
	private DictionaryService dictionaryService;
	
	private static final String CREATE = "management/system/dictionary/create";
	private static final String UPDATE = "management/system/dictionary/update";
	private static final String LIST = "management/system/dictionary/list";
	
	@RequiresPermissions("Dictionary:save")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String preCreate(Map<String, Object> map) {
		return CREATE;
	}
	
	@Log(message="添加了id={0}数据字典。")
	@RequiresPermissions("Dictionary:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid Dictionary dictionary) {
		dictionaryService.saveOrUpdate(dictionary);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{dictionary.getId()}));
		return AjaxObject.newOk("数据字典添加成功！").toString();
	}
	
	@ModelAttribute("preloadDictionary")
	public Dictionary preload(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			Dictionary dictionary = dictionaryService.get(id);
			return dictionary;
		}
		return null;
	}
	
	@RequiresPermissions("Dictionary:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Dictionary dictionary = dictionaryService.get(id);
		map.put("dictionary", dictionary);
		return UPDATE;
	}
	
	@Log(message="修改了id={0}数据字典的信息。")
	@RequiresPermissions("Dictionary:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid @ModelAttribute("preloadDictionary")Dictionary dictionary) {
		dictionaryService.saveOrUpdate(dictionary);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{dictionary.getId()}));
		return AjaxObject.newOk("数据字典修改成功！").toString();
	}
	
	@Log(message="批量删除了id={0}数据字典。")
	@RequiresPermissions("Dictionary:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids) {
		for (int i = 0; i < ids.length; i++) {
			Dictionary dictionary = dictionaryService.get(ids[i]);
			dictionaryService.delete(dictionary.getId());
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{Arrays.toString(ids)}));
		return AjaxObject.newOk("数据字典删除成功！").setCallbackType("").toString();
	}

	@RequiresPermissions("Dictionary:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(Long id, ServletRequest request, Page page, Map<String, Object> map) {
		Specification<Dictionary> specification = null;
		if (id != null) {
			specification = DynamicSpecifications.bySearchFilter(request, Dictionary.class,
					new SearchFilter("parent.id", Operator.EQ, id));
			
			map.put("dictionaryType", DictionaryType.ITEM.name());
			map.put("pDictionary", dictionaryService.get(id));
		} else {
			specification = DynamicSpecifications.bySearchFilter(request, Dictionary.class,
					new SearchFilter("type", Operator.EQ, DictionaryType.THEME.name()));
			map.put("dictionaryType", DictionaryType.THEME.name());
		}
		List<Dictionary> dictionarys = dictionaryService.findByExample(specification, page);
		
		map.put("page", page);
		map.put("dictionarys", dictionarys);
		
		return LIST;
	}
}

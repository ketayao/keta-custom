package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.ketayao.ketacustom.entity.main.Dictionary;
import com.ketayao.ketacustom.service.DictionaryService;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月8日 下午4:23:29 
 */
@Component
public class DictionaryTag extends SimpleTagSupport implements ApplicationContextAware {
	// 字典主题名称
	private String themeName;
	// 选中的名称
	private String selectedValue;
	// 变量名称
	private String paramName;
	// class名称
	private String className;
	// 分页参数
	private Page page;
	
	private static DictionaryService dictionaryService;
	
	/* (non-Javadoc)
	 * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	 */
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		dictionaryService = applicationContext.getBean(DictionaryService.class);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		List<Dictionary> dictionaries = dictionaryService.findByThemeName(themeName, page);
		
		StringBuilder builder = new StringBuilder();
		if (className != null) {
			builder.append("<select name=\"" + paramName + "\" class=\"" + className + "\">\n");
		} else {
			builder.append("<select name=\"" + paramName + "\">\n");
		}
		
		getJspContext().getOut().write(builder.toString());
		//输出自定义选项
        getJspBody().invoke(null);
        
        builder = new StringBuilder();
		for (Dictionary dictionary : dictionaries) {
			if (dictionary.getValue().equals(selectedValue)) {
				builder.append("<option value=\"" + dictionary.getValue() + "\" selected=\"selected\">" + dictionary.getName() + "</option>\n");
			} else {
				builder.append("<option value=\"" + dictionary.getValue() + "\">" + dictionary.getName() + "</option>\n");
			}
		}
		builder.append("</select>\n");
		
		getJspContext().getOut().write(builder.toString());
	}
	
	/**
	 * @param themeName the themeName to set
	 */
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	/**
	 * @param selectedValue the selectedValue to set
	 */
	public void setSelectedValue(String selectedValue) {
		this.selectedValue = selectedValue;
	}

	/**
	 * @param paramName the paramName to set
	 */
	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	/**
	 * @param className the className to set
	 */
	public void setClassName(String className) {
		this.className = className;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(Page page) {
		this.page = page;
	}
	
}

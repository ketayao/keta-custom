package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月14日 下午5:19:57 
 */
public class PaginationTag extends SimpleTagSupport {

	private Page page;
	
	private int pageNumShown = 10;
	private int begin = 10;
	private int end = 50;
	private int step = 5;
	private String targetType = "navTab";
	private String onchange = "navTabPageBreak({numPerPage:this.value})";
	private String rel;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		StringBuilder builder = new StringBuilder();
		builder.append("<div class=\"panelBar\">\n");
		builder.append("	<div class=\"pages\">\n");
		builder.append("		<span>每页显示</span>\n");
		builder.append("		<select name=\"numPerPage\" onchange=\"" + onchange + "\">\n");
		
		for (int i = begin; i <= end; i = i + step) {
			if (page.getNumPerPage() == i) {
				builder.append("			<option value=\"" + i + "\" selected=\"selected\">" + i + "</option>\n");
			} else if (i % step == 0) {
				builder.append("			<option value=\"" + i + "\">" + i + "</option>\n");
			}
		}
		builder.append("		</select>\n");
		builder.append("		<span>总条数: " + page.getTotalCount() + "</span>\n");
		builder.append("	</div>\n");
		
		if (rel != null) {
			builder.append("<div rel=\"" + rel + "\" class=\"pagination\" targetType=\"" + targetType + 
					"\" totalCount=\"" + page.getTotalCount() + "\" numPerPage=\"" + page.getNumPerPage() + "\" pageNumShown=\"" 
					+ pageNumShown+ "\" currentPage=\"" + page.getPageNum() + "\"></div>\n");
		} else {
			builder.append("<div class=\"pagination\" targetType=\"" + targetType + 
					"\" totalCount=\"" + page.getTotalCount() + "\" numPerPage=\"" + page.getNumPerPage() + "\" pageNumShown=\"" 
					+ pageNumShown+ "\" currentPage=\"" + page.getPageNum() + "\"></div>\n");
		}
		
		builder.append("</div>\n");
		
		getJspContext().getOut().write(builder.toString());
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(Page page) {
		this.page = page;
	}

	/**
	 * @param pageNumShown the pageNumShown to set
	 */
	public void setPageNumShown(int pageNumShown) {
		this.pageNumShown = pageNumShown;
	}

	/**
	 * @param begin the begin to set
	 */
	public void setBegin(int begin) {
		this.begin = begin;
	}

	/**
	 * @param end the end to set
	 */
	public void setEnd(int end) {
		this.end = end;
	}

	/**
	 * @param step the step to set
	 */
	public void setStep(int step) {
		this.step = step;
	}

	/**
	 * @param targetType the targetType to set
	 */
	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}

	/**
	 * @param onchange the onchange to set
	 */
	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	/**
	 * @param rel the rel to set
	 */
	public void setRel(String rel) {
		this.rel = rel;
	}
}

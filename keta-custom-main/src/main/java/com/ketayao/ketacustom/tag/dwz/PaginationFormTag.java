package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月15日 上午11:27:43 
 */
public class PaginationFormTag extends SimpleTagSupport {

	private Page page;
	private String action;
	private String onsubmit;

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		StringBuilder builder = new StringBuilder();
		if (onsubmit != null) {
			builder.append("<form id=\"pagerForm\" method=\"post\" action=\"" + action + "\" onsubmit=\"" + onsubmit + "\">\n");
		} else {
			builder.append("<form id=\"pagerForm\" method=\"post\" action=\"" + action + "\">\n");
		}
		
		builder.append("<input type=\"hidden\" name=\"pageNum\" value=\"" + page.getPageNum() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"numPerPage\" value=\"" + page.getNumPerPage() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"orderField\" value=\"" + page.getOrderField() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"orderDirection\" value=\"" + page.getOrderDirection() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"totalCount\" value=\"" + page.getTotalCount() + "\"/>\n");

		getJspContext().getOut().write(builder.toString());
		
		getJspBody().invoke(null);
		
		getJspContext().getOut().write("</form>\n");
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(Page page) {
		this.page = page;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @param onsubmit the onsubmit to set
	 */
	public void setOnsubmit(String onsubmit) {
		this.onsubmit = onsubmit;
	}
}

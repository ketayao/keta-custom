package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.ketayao.ketacustom.entity.main.Module;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月15日 上午11:42:36 
 */
public class MenuAccordionTag extends SimpleTagSupport {

	private Module child;
	private String urlPrefix;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().write(link(child));
		loop(child);
	}
	
	private void loop(Module module) throws IOException, JspException {
		if (module.getChildren() != null && module.getChildren().size() > 0) {
			getJspContext().getOut().write("<ul>\n");
			for (Module m : module.getChildren()) {
				getJspContext().getOut().write("<li>\n");
				
				getJspContext().getOut().write(link(m));
				loop(m);
				getJspContext().getOut().write("</li>\n");
			}
			getJspContext().getOut().write("</ul>\n");
		}
	}
	
	private String link(Module module) {
		StringBuilder builder = new StringBuilder();
		//打开外部链接
		if (module.getUrl().startsWith("http:") || module.getUrl().startsWith("https:")) {
			builder.append("<a href=\"" + module.getUrl() + "\" target=\"navTab\" external=\"true\" rel=\"" + 
					module.getSn() + "_" + module.getId() + "\">" + module.getName() + "</a>\n");
		} else if (module.getUrl().startsWith("/") || module.getUrl().startsWith("\\")) {
			//打开内部链接
			builder.append("<a href=\"" + urlPrefix + module.getUrl() + "\" target=\"navTab\"  rel=\"" + 
					module.getSn() + "_" + module.getId() + "\">" + module.getName() + "</a>\n");
		} else if (module.getUrl().endsWith("#")) {
			//当前链接
			builder.append("<a href=\"" + module.getUrl() + "\" target=\"navTab\"  rel=\"" + 
					module.getSn() + "_" + module.getId() + "\">" + module.getName() + "</a>\n");
		} else {
			//打开内部链接，自动补齐'/'
			builder.append("<a href=\"" + urlPrefix + "/" + module.getUrl() + "\" target=\"navTab\"  rel=\"" + 
					module.getSn() + "_" + module.getId() + "\">" + module.getName() + "</a>\n");
		}
		
		return builder.toString();
	}

	/**
	 * @param child the child to set
	 */
	public void setChild(Module child) {
		this.child = child;
	}

	/**
	 * @param urlPrefix the urlPrefix to set
	 */
	public void setUrlPrefix(String urlPrefix) {
		this.urlPrefix = urlPrefix;
	}
}

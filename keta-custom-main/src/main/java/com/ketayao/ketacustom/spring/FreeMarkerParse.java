package com.ketayao.ketacustom.spring;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freemarker.ext.servlet.AllHttpScopesHashModel;
import freemarker.ext.servlet.FreemarkerServlet;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.ext.servlet.HttpRequestParametersHashModel;
import freemarker.ext.servlet.HttpSessionHashModel;
import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleHash;
import freemarker.template.Template;

/**
 * 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月24日 上午9:59:25
 */
public class FreeMarkerParse {
	
	private Configuration configuration = new Configuration();
	
	public FreeMarkerParse() {
		configuration.setDefaultEncoding("UTF-8");
		configuration.setDateFormat("yyyy-MM-dd HH:mm:ss");
		configuration.setNumberFormat("#0.#");
	}
	
	/**
	 * @return the configuration
	 */
	public Configuration getConfiguration() {
		return configuration;
	}

	public String renderString(String templateString, Object model) {
		try {
			StringWriter result = new StringWriter();
			Template t = new Template("renderString", new StringReader(templateString), configuration);
			t.process(model, result);
			return result.toString();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	protected SimpleHash buildTemplateModel(Map<String, Object> model, 
			ServletContext servletContext,
            final HttpServletRequest request,
            final HttpServletResponse response) {
		AllHttpScopesHashModel fmModel = new AllHttpScopesHashModel(getObjectWrapper(), servletContext, request);

		fmModel.put(FreemarkerServlet.KEY_SESSION, buildSessionModel(request, response));
		fmModel.put(FreemarkerServlet.KEY_REQUEST, new HttpRequestHashModel(request, response, getObjectWrapper()));
		fmModel.put(FreemarkerServlet.KEY_REQUEST_PARAMETERS, new HttpRequestParametersHashModel(request));
		fmModel.putAll(model);
		
		return fmModel;
	}
	
	protected ObjectWrapper getObjectWrapper() {
		ObjectWrapper ow = getConfiguration().getObjectWrapper();
		return (ow != null ? ow : ObjectWrapper.DEFAULT_WRAPPER);
	}
	
	private HttpSessionHashModel buildSessionModel(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			return new HttpSessionHashModel(session, getObjectWrapper());
		}
		else {
			return new HttpSessionHashModel(null, request, response, getObjectWrapper());
		}
	}
}
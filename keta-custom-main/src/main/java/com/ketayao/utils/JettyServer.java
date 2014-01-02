package com.ketayao.utils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.nio.SelectChannelConnector;
import org.eclipse.jetty.util.resource.ResourceCollection;
import org.eclipse.jetty.webapp.WebAppClassLoader;
import org.eclipse.jetty.webapp.WebAppContext;

public class JettyServer {

	private static final String DEFAULT_WEBAPP_PATH = "src/main/webapp";
	private static final String WINDOWS_WEBDEFAULT_PATH = "jetty/webdefault-windows.xml";
	
	private static final String KETA_CUSTOM_RESOURCES = "../keta-custom-resources/src/main/webapp";
	
	private int port = 8080;
	private String context;
	private String webXmlPath = KETA_CUSTOM_RESOURCES;
	
	private Server server;
	private WebAppContext webAppContext;
	
	private ResourceCollection resources = new ResourceCollection(new String[] {
			DEFAULT_WEBAPP_PATH,
			KETA_CUSTOM_RESOURCES,
	});
		
	public JettyServer(String context) {
		this.context = context;
		init();
	}
	
	public JettyServer(int port, String context) {
		this.port = port;
		this.context = context;
		
		init();
	}
	
	public JettyServer(int port, String context, String webXmlPath) {
		this.port = port;
		this.context = context;
		this.webXmlPath = webXmlPath;
		
		init();
	}
	
	private void init() {
		this.server = createServerInSource(this.port, this.context, this.webXmlPath);
		this.webAppContext = (WebAppContext) this.server.getHandler();
	}

	/**
	 * 创建用于开发运行调试的Jetty Server, 以src/main/webapp为Web应用目录.
	 * @param port 端口号
	 * @param contextPath 应用路径
	 * @param webXmlPath web.xml目录
	 * @return
	 */
	private Server createServerInSource(int port, String contextPath, String webXmlPath) {
		Server server = new Server();
		//设置在JVM退出时关闭Jetty的钩子。
		server.setStopAtShutdown(true);

		SelectChannelConnector connector = new SelectChannelConnector();
		connector.setPort(port);
		//解决Windows下重复启动Jetty居然不报告端口冲突的问题.
		connector.setReuseAddress(false);
		server.setConnectors(new Connector[] { connector });

		//WebAppContext webContext = new WebAppContext(DEFAULT_WEBAPP_PATH, contextPath);
		WebAppContext webContext = new WebAppContext(webXmlPath, contextPath);
		//修改webdefault.xml，解决Windows下Jetty Lock住静态文件的问题.		
		webContext.setDefaultsDescriptor(WINDOWS_WEBDEFAULT_PATH);
		
		webContext.setResourceAlias(DEFAULT_WEBAPP_PATH, contextPath);
		
		webContext.setBaseResource(resources);
		
		server.setHandler(webContext);
		return server;
	}
	
	/**
	 * 加入其它目录的资源文件。
	 * @param server
	 * @param resources
	 * @throws IOException 
	 * @throws MalformedURLException 
	 */
	public void addOtherResources(String... paths) throws MalformedURLException, IOException {
		if (paths == null || paths.length < 1) {
			return ;
		}
		
		List<String> pathList = new ArrayList<String>();
		pathList.add(DEFAULT_WEBAPP_PATH);
		
		for (String p : paths) {
			if (!pathList.contains(p)) {
				pathList.add(p);
			}
		}
		
		if (!pathList.contains(KETA_CUSTOM_RESOURCES)) {
			pathList.add(KETA_CUSTOM_RESOURCES);
		}
		
		this.resources = new ResourceCollection(pathList.toArray(new String[pathList.size()]));
		
		webAppContext.setBaseResource(resources);
	}
	
	/**
	 * 类似/target/classes/;/etc/jetty/classes/
	 * @param paths
	 */
	public void addOtherClasses(String extraClasspath) {
		webAppContext.setExtraClasspath(extraClasspath);
	}

	/**
	 * 设置除jstl-*.jar外其他含tld文件的jar包的名称.
	 * jar名称不需要版本号，如sitemesh, shiro-web
	 */
	public void setTldJarNames(String... jarNames) {
		List<String> jarNameExprssions = new ArrayList<String>();
		jarNameExprssions.add(".*/jstl-[^/]*\\.jar$");
		jarNameExprssions.add(".*/.*taglibs[^/]*\\.jar$");
		
		for (String jarName : jarNames) {
			jarNameExprssions.add(".*/" + jarName + "-[^/]*\\.jar$");
		}

		this.webAppContext.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern",
				StringUtils.join(jarNameExprssions, '|'));

	}

	/**
	 * 快速重新启动application，重载target/classes与target/test-classes.
	 */
	public void reloadContext() throws Exception {
		System.out.println("Application reloading");
		this.webAppContext.stop();

		WebAppClassLoader classLoader = new WebAppClassLoader(this.webAppContext);
		classLoader.addClassPath("target/classes");
		classLoader.addClassPath("target/test-classes");
		this.webAppContext.setClassLoader(classLoader);

		this.webAppContext.start();

		System.out.println("Application reloaded");
	}
	
	public void start() throws Exception {
		server.start();
	}

	public int getPort() {
		return port;
	}

	public String getContext() {
		return context;
	}

	public String getWebXmlPath() {
		return webXmlPath;
	}

	public Server getServer() {
		return server;
	}

	public WebAppContext getWebAppContext() {
		return webAppContext;
	}

	public ResourceCollection getResources() {
		return resources;
	}

	public void setResources(ResourceCollection resources) {
		this.resources = resources;
	}
	
}

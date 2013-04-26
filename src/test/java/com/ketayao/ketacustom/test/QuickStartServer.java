package com.ketayao.ketacustom.test;

import org.eclipse.jetty.server.Server;
import org.springside.modules.test.jetty.JettyFactory;

/**
 * 使用Jetty运行调试Web应用, 在Console输入回车快速重新加载应用.
 * 
 * @author calvin
 */
public class QuickStartServer {

	public static final int PORT = 9090;
	public static final String CONTEXT = "/keta-custom";
	public static final String BASE_URL = "http://localhost:" + PORT + CONTEXT;
	public static final String[] TLD_JAR_NAMES = new String[] {"spring-webmvc", "shiro-web",
			"springside-core" };

	public static void main(String[] args) throws Exception {
		// 设定Spring的profile
		System.setProperty("spring.profiles.active", "production");

		// 启动Jetty
		Server server = JettyFactory.createServerInSource(PORT, CONTEXT);
		JettyFactory.setTldJarNames(server, TLD_JAR_NAMES);

		try {
			server.start();
			
			System.out.println("Server running at " + BASE_URL);
			System.out.println("Hit 'r' to reload the application");

			while (true) {
				char c = (char) System.in.read();
				if (c == 'r') {
					JettyFactory.reloadContext(server);
				} else if (c == 'q') {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.exit(-1);
		}
	}
}

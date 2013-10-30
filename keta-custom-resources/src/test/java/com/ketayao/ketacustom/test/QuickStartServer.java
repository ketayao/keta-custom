package com.ketayao.ketacustom.test;

import com.ketayao.utils.JettyServer;


/**
 * 使用Jetty运行调试Web应用, 在Console输入r快速重新加载应用.
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

		JettyServer jettyServer = new JettyServer(PORT, CONTEXT);
		jettyServer.setTldJarNames(TLD_JAR_NAMES);
		
		// 启动Jetty
		try {
			jettyServer.start();
			
			System.out.println("启动成功，请使用该路径访问系统：" + BASE_URL);
			System.out.println("在控制台输入'r'重新加载应用，输入'q'退出jetty程序！");

			while (true) {
				char c = (char) System.in.read();
				if (c == 'r') {
					jettyServer.reloadContext();
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

package com.ketayao.ketacustom.generate.test;

import org.junit.Test;

import com.ketayao.ketacustom.generate.GenerateServer;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月24日 上午10:57:56 
 */
public class GenerateServerTest {
	@Test
	public void testServer() {
		try {
			new GenerateServer().generate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

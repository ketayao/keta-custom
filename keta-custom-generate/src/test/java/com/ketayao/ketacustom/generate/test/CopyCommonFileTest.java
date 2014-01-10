package com.ketayao.ketacustom.generate.test;

import org.junit.Test;

import com.ketayao.ketacustom.generate.CopyCommonFile;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月9日 下午5:13:13 
 */
public class CopyCommonFileTest {
	@Test
	public void test() {
		try {
			new CopyCommonFile().copy();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

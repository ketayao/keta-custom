package com.ketayao.ketacustom.generate.test;

import com.ketayao.ketacustom.generate.GenerateFactory;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月22日 下午4:08:36 
 */
public class GenerateFactoryTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		GenerateFactory factory = new GenerateFactory("ss_task");  
		
		factory.genJavaTemplate();
		factory.genJspTemplate();
		factory.genSettings();
		factory.genServer();
		factory.copyCommons();
	}

}

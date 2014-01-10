package com.sample.test;

import com.ketayao.ketacustom.generate.GenerateFactory;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月23日 下午4:49:35 
 */
public class Gen {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		GenerateFactory factory = new GenerateFactory();
		
		factory.genJavaTemplate();
		factory.genJspTemplate();
		factory.genSettings();
		factory.genServer();
		factory.copyCommons();
	}

}

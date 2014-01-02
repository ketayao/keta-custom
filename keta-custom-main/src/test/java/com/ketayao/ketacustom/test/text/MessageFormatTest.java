/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.test.text.MessageFormat.java
 * Class:			MessageFormat
 * Date:			2013-5-5
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.test.text;

import java.text.ChoiceFormat;
import java.text.MessageFormat;

import org.junit.Test;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-5 上午11:26:23 
 */

public class MessageFormatTest {
	@Test
	public void test() {
		MessageFormat form = new MessageFormat("The disk \"{1}\" contains {0}.");
		 double[] filelimits = {0,1,2};
		 String[] filepart = {"no files","one file","{0,number} files"};
		 ChoiceFormat fileform = new ChoiceFormat(filelimits, filepart);
		 form.setFormatByArgumentIndex(0, fileform);

		 int fileCount = 1273;
		 String diskName = "MyDisk";
		 Object[] testArgs = {new Long(fileCount), diskName};

		 System.out.println(form.format(testArgs));
	}
}

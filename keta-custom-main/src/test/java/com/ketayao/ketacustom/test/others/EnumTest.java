package com.ketayao.ketacustom.test.others;

import org.apache.commons.lang3.EnumUtils;
import org.junit.Assert;
import org.junit.Test;

import com.ketayao.ketacustom.log.LogLevel;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月31日 下午2:17:14 
 */
public class EnumTest {
	@Test
	public void test() {
		Assert.assertEquals(LogLevel.TRACE, EnumUtils.getEnum(LogLevel.class, "TRACE"));
	}
}

/**
 * 
 */
package com.ketayao.ketacustom.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

import com.ketayao.ketacustom.spring.FreeMarkerParse;

/**
 * @author KETAYAO
 *
 */
public class RegexTest {
	private static Pattern FREEMARKER_PATTERN = Pattern.compile("^ftl(.*)$");
	
	@Test
	public void testFREEMARKER_PATTERN() {
		String value = "ftl(<#if 2gt1>hh</#if>)";
		
		Matcher matcher = FREEMARKER_PATTERN.matcher(value);
		if (matcher.find()) {
			value = value.substring(matcher.start() + 4, matcher.end() - 1);
			System.out.println(value);
		}
		
		FreeMarkerParse freeMarkerParse = new FreeMarkerParse();
		System.out.println(freeMarkerParse.renderString(value, null));
	}
}

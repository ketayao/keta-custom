/**
 * 
 */
package com.ketayao.ketacustom.test;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.junit.Test;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author KETAYAO
 *
 */
public class JsonTest {
	private ObjectMapper objectMapper = new ObjectMapper(); 
	
	@Test
	public void toMap() throws Exception {
		String beanString = "{\"name\":\"A\"}";
		Map<String, String> map = objectMapper.readValue(beanString, Map.class);
		
		Set<Entry<String, String>> set = map.entrySet();
		for (Entry<String, String> entry : set) {
			System.out.println(entry.getKey() + "=" + entry.getValue());
		}
	}
}

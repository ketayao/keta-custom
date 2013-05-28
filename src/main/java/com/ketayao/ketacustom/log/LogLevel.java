/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.log.LogLevel.java
 * Class:			LogLevel
 * Date:			2013-5-3
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.log;

/** 
 * 值越大，等级越高。 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-3 下午4:29:47 
 */

public enum LogLevel {
	TRACE("TRACE"),
	
	DEBUG("DEBUG"),
	
	INFO("INFO"),
	
	WARN("WARN"),
	
	ERROR("ERROR");
	
	private String value;
	
	LogLevel(String value) {
		this.value = value;
	}
	
	public String value() {
		return this.value;
	}
}

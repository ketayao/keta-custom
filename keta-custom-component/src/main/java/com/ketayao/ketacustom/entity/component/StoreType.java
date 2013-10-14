/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.component.StoreType.java
 * Class:			StoreType
 * Date:			2013-7-1
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity.component;

/** 
 * 资源存储类型，存入数据库DB，存入文件FILE。	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-7-1 下午3:04:58 
 */

public enum StoreType {
	DB("db"), FILE("file");
	
	private String value;
	
	StoreType(String value) {
		this.value = value;
	}
	
	public String value() {
		return this.value;
	}
}

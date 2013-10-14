/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.log.Log.java
 * Class:			Log
 * Date:			2013-5-3
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.log;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-3 下午4:30:47 
 */
@Documented
@Target({METHOD})
@Retention(RUNTIME)
public @interface Log {
	/**
	 * 
	 * 日志信息
	 * @return
	 */
	String message();
	
	/**
	 * 
	 * 日志记录等级
	 * @return
	 */
	LogLevel level() default LogLevel.TRACE;
	
	/**
	 * 
	 * 是否覆盖包日志等级
	 * 1.为false不会参考level属性。
	 * 2.为true会参考level属性。
	 * @return
	 */
	boolean override() default false;
}

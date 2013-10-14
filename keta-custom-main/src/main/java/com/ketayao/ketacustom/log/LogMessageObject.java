/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.log.LogMessageObject.java
 * Class:			LogMessageObject
 * Date:			2013-5-27
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.log;


/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-27 上午11:47:23 
 */

public class LogMessageObject {
	// 是否写入log，默认为true
	private boolean isWritten = true;
	
	// message对象参数
	private Object[] objects;
	
	/**  
	 * 构造函数  
	 */ 
	public LogMessageObject() {
	}
	
	/**  
	 * 构造函数
	 * @param isWritten
	 * @param objects  
	 */ 
	public LogMessageObject(boolean isWritten) {
		super();
		this.isWritten = isWritten;
	}

	/**  
	 * 构造函数
	 * @param isWritten
	 * @param objects  
	 */ 
	public LogMessageObject(boolean isWritten, Object[] objects) {
		super();
		this.isWritten = isWritten;
		this.objects = objects;
	}
	
	public static LogMessageObject newWrite(){
		return new LogMessageObject(true);
	}
	
	public static LogMessageObject newIgnore(){
		return new LogMessageObject(false);
	}

	/**  
	 * 返回 isWritten 的值   
	 * @return isWritten  
	 */
	public boolean isWritten() {
		return isWritten;
	}

	/**  
	 * 设置 isWritten 的值  
	 * @param isWritten
	 */
	public LogMessageObject setWritten(boolean isWritten) {
		this.isWritten = isWritten;
		return this;
	}

	/**  
	 * 返回 objects 的值   
	 * @return objects  
	 */
	public Object[] getObjects() {
		return objects;
	}

	/**  
	 * 设置 objects 的值  
	 * @param objects
	 */
	public LogMessageObject setObjects(Object[] objects) {
		this.objects = objects;
		return this;
	}
	
}

/**
 * <pre>
 * Date:			2013年10月17日
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Description:
 * </pre>
 **/
 
package com.ketayao.ketacustom.entity;

import java.io.Serializable;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月17日 下午4:13:13 
 */

public interface Idable<T extends Serializable> {
	public T getId();

	public void setId(T id);
}
